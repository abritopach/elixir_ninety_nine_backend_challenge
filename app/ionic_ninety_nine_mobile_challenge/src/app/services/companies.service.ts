import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { timeout, retryWhen, delay } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class CompaniesService {

  private readonly API_ENDPOINT: string = 'https://dev.ninetynine.com/testapi/1/';

  constructor(private http: HttpClient) { }

  getCompanies(): Observable<any[]> {
    return this.http
    .get<any[]>(this.API_ENDPOINT + 'companies')
    .pipe(
      retryWhen(error => error.pipe(delay(500))),
      timeout(5000)
    );
  }

  getCompanyById(id: number): Observable<any> {
    return this.http
    .get<any>(encodeURI(this.API_ENDPOINT + `companies/${id}`))
    .pipe(
      retryWhen(error => error.pipe(delay(500))),
      timeout(5000)
    );
  }
}
