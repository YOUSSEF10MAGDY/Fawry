import { Component } from '@angular/core';
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
    const slotIndex = this.timeSlots.findIndex((s) => s.time === this.selectedTime);
    if (slotIndex !== -1) {
      this.timeSlots[slotIndex].isBooked = true;
      this.timeSlots[slotIndex].patientName = this.patientName;
    }

    this.showConfirmation = true;

    setTimeout(() => {
      this.showConfirmation = false;
      this.patientName = '';
      this.selectedTime = '';
    }, 3000);
  }
}
