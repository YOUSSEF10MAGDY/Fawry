import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Doctor {
  id?: string;
  name: string;
  specialty: string;
}

export interface Appointment {
  id?: string;
  patientName: string;
  doctorId: string;
  time: string;
}

@Injectable({
  providedIn: 'root',
})
export class AppointmentService {
  private http = inject(HttpClient);
  private baseUrl = 'http://localhost:3000';

  getDoctors(): Observable<Doctor[]> {
    return this.http.get<Doctor[]>(`${this.baseUrl}/doctors`);
  }

  addDoctor(doctor: Doctor): Observable<Doctor> {
    return this.http.post<Doctor>(`${this.baseUrl}/doctors`, doctor);
  }

  getAppointments(): Observable<Appointment[]> {
    return this.http.get<Appointment[]>(`${this.baseUrl}/appointments`);
  }

  addAppointment(app: Appointment): Observable<Appointment> {
    return this.http.post<Appointment>(`${this.baseUrl}/appointments`, app);
  }

  updateAppointment(id: string, appointment: Partial<Appointment>): Observable<Appointment> {
    return this.http.patch<Appointment>(`${this.baseUrl}/appointments/${id}`, appointment);
  }

  deleteAppointment(id: string): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/appointments/${id}`);
  }
}
