import { Component, signal } from '@angular/core';
import { Header } from './header/header';
import { SideMenu } from './side-menu/side-menu';
import { PatientForm } from './patient-form/patient-form';

@Component({
  selector: 'app-root',
  imports: [Header, SideMenu, PatientForm],
  templateUrl: './app.html',
  styleUrl: './app.css',
})
export class App {
  protected readonly title = signal('clinic-system');
}
