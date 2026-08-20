import { ChangeDetectorRef, Component, inject, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { Appointment, AppointmentService, Doctor } from './appointment';

interface TimeSlot {
  time: string;
  isBooked: boolean;
  patientName?: string;
}

@Component({
  selector: 'app-patient-form',
  standalone: true,
  imports: [FormsModule, ReactiveFormsModule],
  templateUrl: './patient-form.html',
  styleUrl: './patient-form.css',
})
export class PatientForm implements OnInit {
  bookingForm!: FormGroup;
  doctors: Doctor[] = [];
  allAppointments: Appointment[] = [];
  baseTimes = ['09:00 ص', '10:00 ص', '11:00 ص', '12:00 م', '01:00 م', '02:00 م'];
  timeSlots: TimeSlot[] = [];
  showConfirmation: boolean = false;
  showisNameExists: boolean = false;
  showNameisRequired: boolean = false;
  private fb = inject(FormBuilder);
  private appointmentService = inject(AppointmentService);
  private cdr = inject(ChangeDetectorRef);
  private timeoutId: any;

  ngOnInit() {
    this.bookingForm = this.fb.group({
      doctorId: ['', Validators.required],
      patientName: ['', [Validators.required, Validators.minLength(3)]],
      selectedTime: ['', Validators.required],
    });

    this.loadInitialData();
    {
      this.appointmentService.getDoctors().subscribe({
        next: (docs) => {
          this.doctors = docs;
          this.cdr.detectChanges();
        },
        error: (err: any) => {
          console.error(err);
        },
      });

      this.appointmentService.getAppointments().subscribe({
        next: (apps) => {
          this.allAppointments = apps;
          this.updateTimeSlotsForSelectedDoctor();
          this.cdr.detectChanges();
        },
        error: (err: any) => {
          console.error(err);
        },
      });
    }

    this.bookingForm.get('doctorId')?.valueChanges.subscribe(() => {
      this.updateTimeSlotsForSelectedDoctor();
    });
  }

  loadInitialData() {
    this.appointmentService.getDoctors().subscribe((docs) => {
      this.doctors = docs;
    });

    this.appointmentService.getAppointments().subscribe((apps) => {
      this.allAppointments = apps;
    });
  }

  updateTimeSlotsForSelectedDoctor() {
    const selectedDocId = this.bookingForm.get('doctorId')?.value;
    const doctorAppointments = this.allAppointments.filter((app) => app.doctorId === selectedDocId);

    this.timeSlots = this.baseTimes.map((time) => {
      const found = doctorAppointments.find((app) => app.time === time);
      return {
        time: time,
        isBooked: !!found,
        patientName: found?.patientName,
      };
    });
    this.cdr.detectChanges();
  }

  selectTime(time: string) {
    this.bookingForm.patchValue({ selectedTime: time });
  }

  scheduleAppointment() {
    this.showisNameExists = false;
    this.showNameisRequired = false;
    this.showConfirmation = false;

    const rawName = this.bookingForm.get('patientName')?.value || '';
    const trimmedName = rawName.trim();

    if (this.bookingForm.invalid || trimmedName.length === 0) {
      this.bookingForm.markAllAsTouched();
      this.showNameisRequired = true;
      return;
    }

    const selectedDocId = this.bookingForm.get('doctorId')?.value;
    const selectedTime = this.bookingForm.get('selectedTime')?.value;

    const isNameExists = this.timeSlots.some(
      (slot) => slot.isBooked && slot.patientName === trimmedName,
    );

    if (isNameExists) {
      this.showisNameExists = true;
      return;
    }

    const newAppointment: Appointment = {
      patientName: trimmedName,
      doctorId: selectedDocId,
      time: selectedTime,
    };

    this.appointmentService.addAppointment(newAppointment).subscribe(() => {
      this.showConfirmation = true;
      this.bookingForm.reset();

      this.appointmentService.getAppointments().subscribe((apps) => {
        this.allAppointments = apps;
        this.updateTimeSlotsForSelectedDoctor();
      });

      if (this.timeoutId) clearTimeout(this.timeoutId);
      this.timeoutId = setTimeout(() => {
        this.showConfirmation = false;
        this.cdr.detectChanges();
      }, 3000);
    });
  }
}
