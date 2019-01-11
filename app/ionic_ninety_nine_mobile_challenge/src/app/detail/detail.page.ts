import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CompaniesService } from './../services/companies.service';

@Component({
  selector: 'app-detail',
  templateUrl: './detail.page.html',
  styleUrls: ['./detail.page.scss'],
})
export class DetailPage implements OnInit {

  currentYear: Number = new Date().getFullYear();
  company: any;

  constructor(private route: ActivatedRoute, private companiesServices: CompaniesService) { }

  ngOnInit() {
    const companyId = this.route.snapshot.paramMap.get('id');
    console.log('companyId', companyId);
    this.getCompanyById(companyId);
    setInterval(() => {
      this.getCompanyById(companyId);
    }, 20000);
  }

  getCompanyById(companyId) {
    this.companiesServices.getCompanyById(companyId).subscribe(result => {
      console.log('result', result);
      this.company = result;
    });
  }

}
