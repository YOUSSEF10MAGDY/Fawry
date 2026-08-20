import { ChangeDetectorRef, Component, inject, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Appointment, AppointmentService, Doctor } from '../patient-form/appointment';

@Component({
  selector: 'app-appointments-list',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './appointments-list.html',
  styleUrl: './appointments-list.css',
})
export class AppointmentsListComponent implements OnInit {
  doctors: Doctor[] = [];
  appointments: Appointment[] = [];
  selectedDoctorId: string = '';
  editingId: string | null = null;
  updatedPatientName: string = '';
  private appointmentService = inject(AppointmentService);
  private cdr = inject(ChangeDetectorRef);

  get filteredAppointments() {
    if (!this.selectedDoctorId) return [];
    return this.appointments.filter((app) => app.doctorId === this.selectedDoctorId);
  }

  ngOnInit() {
    this.loadData();
  }

  loadData() {
    this.appointmentService.getDoctors().subscribe((docs) => (this.doctors = docs));
    this.appointmentService.getAppointments().subscribe((apps) => {
      this.appointments = apps;
      this.cdr.detectChanges();
    });
  }

  deleteAppointment(id?: string) {
    if (!id) return;
    if (confirm('هل أنت متأكد من حذف هذا الموعد؟')) {
      this.appointmentService.deleteAppointment(id).subscribe(() => {
        this.loadData();
      });
    }
  }

  startEdit(app: Appointment) {
    this.editingId = app.id || null;
    this.updatedPatientName = app.patientName;
  }

  saveEdit(id?: string) {
    if (!id || !this.updatedPatientName.trim()) return;

    this.appointmentService
      .updateAppointment(id, { patientName: this.updatedPatientName.trim() })
      .subscribe(() => {
        this.editingId = null;
        this.loadData();
      });
  }

  cancelEdit() {
    this.editingId = null;
  }
}
