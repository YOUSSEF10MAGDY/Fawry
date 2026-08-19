import { Component ,ChangeDetectorRef} from '@angular/core';
import { FormsModule } from '@angular/forms';

interface TimeSlot {
  time: string;
  isBooked: boolean;
  patientName?: string;
}

@Component({
  selector: 'app-patient-form',
  imports: [FormsModule],
  templateUrl: './patient-form.html',
  styleUrl: './patient-form.css',
})
export class PatientForm {
  patientName: string = '';
  selectedTime: string = '';

  showConfirmation: boolean = false;
  showisNameExists: boolean = false;
  showNameisRequired: boolean = false;

  private timeoutId: any;
  constructor(private cdr: ChangeDetectorRef) {}
  searchQuery: string = '';

  timeSlots: TimeSlot[] = [
    { time: '09:00 ص', isBooked: true, patientName: ' يوسف مجدي' },
    { time: '10:00 ص', isBooked: false },
    { time: '11:00 ص', isBooked: true, patientName: ' محمد احمد' },
    { time: '12:00 م', isBooked: false },
    { time: '01:00 م', isBooked: false },
    { time: '02:00 م', isBooked: true, patientName: ' حسام حسن' },
  ];

  get filteredAppointments() {
    let booked = this.timeSlots.filter((slot) => slot.isBooked);

    if (this.searchQuery) {
      booked = booked.filter((slot) => slot.patientName?.includes(this.searchQuery));
    }
    return booked;
  }

  selectTime(time: string) {
    this.selectedTime = time;
  }

  scheduleAppointment() {
    this.showConfirmation = false;
    this.showisNameExists = false;
    this.showNameisRequired = false;

    if (!this.patientName || this.patientName.trim().length === 0) {
      this.showNameisRequired = true;
      return;
    }

    const trimmedName = this.patientName.trim();
    const isNameExists = this.timeSlots.some(
      (slot) => slot.isBooked && slot.patientName === trimmedName,
    );

    if (isNameExists) {
      this.showisNameExists = true;
      return;
    }
    const slotIndex = this.timeSlots.findIndex((s) => s.time === this.selectedTime);
    if (slotIndex !== -1) {
      this.timeSlots[slotIndex].isBooked = true;
      this.timeSlots[slotIndex].patientName = this.patientName.trim();
    }

    this.showConfirmation = true;
    this.patientName = '';
    this.selectedTime = '';

    if (this.timeoutId) {
      clearTimeout(this.timeoutId);
    }


    this.timeoutId = setTimeout(() => {
      this.showConfirmation = false;

      this.cdr.detectChanges();
    }, 3000);
  }
}
