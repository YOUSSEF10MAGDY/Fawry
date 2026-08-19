import { Routes } from '@angular/router';
import { PatientForm } from './patient-form/patient-form';

export const routes: Routes = [

  { path: '', redirectTo: 'appointments',pathMatch:'full' },
  { path: 'appointments', component: PatientForm },
  { path: '**', redirectTo: 'appointments' },
];
