import { Injectable } from '@angular/core';
import { Observable, of, throwError } from 'rxjs';
import { HttpClient, HttpHeaders, HttpErrorResponse, HttpResponse } from '@angular/common/http';
import { catchError, tap, map } from 'rxjs/operators';
import { City } from './models/city';
import { Sport } from './models/sport';
import { Company } from './models/company';
import { FeedbackRequest } from './models/feedback-request';

const httpOptions = {
    headers: new HttpHeaders({'Content-Type': 'application/json'})
}

const apiUrl = "http://api.sportibook.localhost/";
//const apiUrl = "http://api.staging.sportibook.com:8080/";

@Injectable({
  providedIn: 'root'
})
export class ApiService {

    constructor(private http: HttpClient) { }
    private handleError<T> (operation = 'operation', result? : T) {
        return (error : any): Observable<T> => {
            console.log(error);
            return of(result as T);
        };
    }
    getCities (): Observable<City[]> {
        return this.http.get<City[]>(apiUrl+"cities/")
            .pipe(
                tap(heroes => console.log('fetched cities')),
                catchError(this.handleError('getCities', []))
            );
    }
    getSportsByCity(city : number): Observable<Sport[]> {
        return this.http.get<Sport[]>(apiUrl + "cities/" + city + "/sports")
            .pipe(
                tap(heroes => console.log('fetched sports')),
                catchError(this.handleError('getSports', []))
            );
    }
    getCompaniesBySportCity(city : number, sport : number): Observable<Company[]> {
        return this.http.get<Company[]>(apiUrl + "cities/" + city + "/sports/" + sport + "/companies")
            .pipe(
                tap(heroes => console.log('fetched companies')),
                catchError(this.handleError('getCompanies', []))
            );
    }
    postBooking(booking) : Observable<string> {
        return this.http.post<string>(apiUrl + "booking/", booking, httpOptions)
            .pipe(
                catchError(this.handleError('postBooking', booking))
            );
    }

    getCompanyByBooking(bookingId:number, bookingUUID:string) : Observable<Company> {
        return this.http.get<Company>(apiUrl + "booking/" + bookingId + "/" + bookingUUID + "/company");
            /*.pipe(
                tap(heroes => console.log('fetched company')),
                catchError(this.handleError('getCompanyByBooking', []))
            );*/
    }

    postFeedback(feedback : FeedbackRequest) : Observable<HttpResponse<FeedbackRequest>> {
        return this.http.post<FeedbackRequest>(apiUrl + "feedback/", feedback, { observe: "response" })
    }

}
