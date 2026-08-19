import { Component, ChangeDetectorRef, OnInit, inject } from '@angular/core';
import {
  FormsModule,
  ReactiveFormsModule,
  FormBuilder,
  FormGroup,
  Validators
} from '@angular/forms';

import { AppointmentService, Appointment } from './appointment';

interface TimeSlot {
  time: string;
  isBooked: boolean;
  patientName?: string;
}

@Component({
  selector: 'app-patient-form',
  imports: [FormsModule,ReactiveFormsModule],
  templateUrl: './patient-form.html',
  styleUrl: './patient-form.css',
})
export class PatientForm implements OnInit {
  private fb = inject(FormBuilder);
  private appointmentService = inject(AppointmentService);
  private cdr = inject(ChangeDetectorRef);

  bookingForm!: FormGroup;

  showConfirmation: boolean = false;
  showisNameExists: boolean = false;
  showNameisRequired: boolean = false;

  baseTimes = ['09:00 ص', '10:00 ص', '11:00 ص', '12:00 م', '01:00 م', '02:00 م'];
  timeSlots: TimeSlot[] = [];

  searchQuery: string = '';
  private timeoutId: any;

  ngOnInit() {
    this.bookingForm = this.fb.group({
      patientName: ['', [Validators.required, Validators.minLength(3)]],
      selectedTime: ['', Validators.required],
    });
    this.loadAppointments();
  }

    loadAppointments() {
      this.appointmentService.getAppointments().subscribe((appointments) => {
        this.timeSlots = this.baseTimes.map(time => {
          const found = appointments.find(app => app.time === time);
          return {
            time: time,
            isBooked: !!found,
            patientName: found?.patientName
          };
        });
        this.cdr.detectChanges();
      });
    }

    get filteredAppointments() {
    let booked = this.timeSlots.filter((slot) => slot.isBooked);
    if (this.searchQuery) {
      booked = booked.filter((slot) => slot.patientName?.includes(this.searchQuery));
    }
    return booked;
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
      const isNameExists = this.timeSlots.some(
        (slot) => slot.isBooked && slot.patientName === trimmedName
      );

    if (isNameExists) {
      this.showisNameExists = true;
      this.bookingForm.patchValue({ patientName: '' });
      return;
    }

      const newAppointment: Appointment = {
        patientName: trimmedName,
        time: this.bookingForm.value.selectedTime
      };

      this.appointmentService.addAppointment(newAppointment).subscribe(() => {
        this.showConfirmation = true;
        this.bookingForm.reset();
        this.loadAppointments();

        if (this.timeoutId) {
          clearTimeout(this.timeoutId);
        }

        this.timeoutId = setTimeout(() => {
          this.showConfirmation = false;
          this.cdr.detectChanges();
        }, 3000);
      });
    }
  }
