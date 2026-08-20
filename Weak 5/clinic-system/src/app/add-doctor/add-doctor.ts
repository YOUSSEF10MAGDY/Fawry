import { Component, inject } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { AppointmentService } from '../patient-form/appointment';

@Component({
  selector: 'app-add-doctor',
  standalone: true,
  imports: [ReactiveFormsModule],
  templateUrl: './add-doctor.html',
  styleUrl: './add-doctor.css',
})
export class AddDoctorComponent {
  showSuccess: boolean = false;
  private fb = inject(FormBuilder);
  doctorForm: FormGroup = this.fb.group({
    name: ['', [Validators.required, Validators.minLength(3)]],
    specialty: ['', Validators.required],
  });
  private appointmentService = inject(AppointmentService);

  onSubmit() {
    if (this.doctorForm.invalid) {
      this.doctorForm.markAllAsTouched();
      return;
    }

    this.appointmentService.addDoctor(this.doctorForm.value).subscribe(() => {
      this.showSuccess = true;
      this.doctorForm.reset();
      setTimeout(() => (this.showSuccess = false), 3000);
    });
  }
}
