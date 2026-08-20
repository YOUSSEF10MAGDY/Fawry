import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { Header } from './header/header';
import { SideMenuComponent } from './side-menu/side-menu';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, Header, SideMenuComponent],
  templateUrl: './app.html',
  styleUrl: './app.css',
})
export class App {}
