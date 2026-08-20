import { Component } from '@angular/core';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [RouterLink],
  template: `
    <div class="welcome-container">
      <h1>أهلاً بك في عيادتك</h1>
      <p>نحن هنا لخدمتك</p>
      <div class="welcome-actions">
        <a routerLink="/booking" class="cta-btn">ابدأ حجز موعد جديد</a>
      </div>
    </div>
  `,
  styles: [
    `
      .welcome-container {
        text-align: center;
        padding: 60px 20px;
        background: #ffffff;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        max-width: 600px;
        margin: 40px auto;
        direction: rtl;
      }
      .welcome-container h1 {
        color: #2c3e50;
        font-size: 28px;
        margin-bottom: 15px;
      }
      .welcome-container p {
        color: #718093;
        font-size: 16px;
        margin-bottom: 30px;
      }
      .cta-btn {
        background: #16025a;
        color: white;
        padding: 12px 25px;
        border-radius: 8px;
        text-decoration: none;
        font-weight: bold;
        transition: background 0.2s;
      }
      .cta-btn:hover {
        background: #2980b9;
      }
    `,
  ],
})
export class HomeComponent {}
