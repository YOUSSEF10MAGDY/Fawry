import { Routes } from '@angular/router';
import { HomeComponent } from './home/home';
import { PatientForm } from './patient-form/patient-form';
import { AddDoctorComponent } from './add-doctor/add-doctor';
import { AppointmentsListComponent } from './appointments-list/appointments-list';

export const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'booking', component: PatientForm },
  { path: 'add-doctor', component: AddDoctorComponent },
  { path: 'appointments', component: AppointmentsListComponent },
  { path: '**', redirectTo: '' },
];
