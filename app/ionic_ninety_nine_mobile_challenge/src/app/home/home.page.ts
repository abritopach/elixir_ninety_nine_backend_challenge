import { Component, OnInit } from '@angular/core';
import { CompaniesService } from '../services/companies.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit {

  currentYear = new Date().getFullYear();
  companies: any[] = [];

  constructor(private companiesServices: CompaniesService) {
    console.log('HomePage::constructor() | method called');
  }

  ngOnInit() {
    console.log('ngOnInit::constructor() | method called');
    this.getCompanies();
    setInterval(() => {
      this.getCompanies();
    }, 20000);
  }

  getCompanies() {
    this.companiesServices.getCompanies().subscribe(result => {
      console.log('result', result);
      result = result.sort((a, b) =>  b.sharePrice - a.sharePrice);
      this.companies = result;
    });
  }
}
