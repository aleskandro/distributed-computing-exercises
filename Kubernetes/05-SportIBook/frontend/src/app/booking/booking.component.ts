import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { City } from '../models/city';
import { Sport } from '../models/sport';
import { Company } from '../models/company';
import { Booking } from '../models/booking';

import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { DomSanitizer, SafeResourceUrl, SafeUrl } from '@angular/platform-browser';

@Component({
  selector: 'app-booking',
  templateUrl: './booking.component.html',
  styleUrls: ['./booking.component.css']
})
export class BookingComponent implements OnInit {
    displayedColumns: string[] = ['id', 'name'];
    cities : City[] = [];
    sports : Sport[] = [];
    companies : Company[] = [];
    instructors : Company[] = [];
    company : Company = new Company();
    facility = false;
    isLoadingResults = true;
    selectedCity = undefined;
    selectedSport = undefined;
    citiesFormGroup: FormGroup;
    bookingFormGroup: FormGroup;
    constructor(private api: ApiService, private _formBuilder: FormBuilder, private _sanitizer: DomSanitizer) { }

    ngOnInit() {
        this.api.getCities()
            .subscribe(res => {
                this.cities = res;
                console.log(this.cities);
                this.isLoadingResults = false;
            }, err => {
                console.log(err);
                this.isLoadingResults = false;
            });
        this.citiesFormGroup = this._formBuilder.group({
            city: ['1', Validators.required]
        });
        this.getSportsByCity();
        this.bookingFormGroup = this._formBuilder.group({
            firstName: ['', Validators.required],
            lastName: ['', Validators.required],
            telephone: ['', Validators.required],
            email: ['', [Validators.required, Validators.email]]
        });
    }

    getSportsByCity() {
        let selectedCity = this.citiesFormGroup.get('city').value;
        console.log("getSportsByCity: " + selectedCity);
        this.api.getSportsByCity(selectedCity)
            .subscribe(res => {
                this.sports = res;
                console.log(this.sports);
            }, err => {
                console.log(err);
            });
    }

    getCompaniesBySportCity(sport : number, stepper) {
        let selectedCity = this.citiesFormGroup.get('city').value;
        this.selectedSport = sport;
        console.log("getCompaniesBySportCity: " + selectedCity + " " + sport);
        this.api.getCompaniesBySportCity(selectedCity, sport)
            .subscribe(res => {
                this.companies = [];
                this.instructors = [];
                res.forEach(company => {
                    company.groups.forEach(group => {
                        if (group.id == 1) // Istruttore
                            this.instructors.push(company);
                        if (group.id == 2) // Struttura
                            this.companies.push(company);
                    });
                });
                //this.companies = res;
                console.log(this.companies);
                console.log(this.instructors);
                stepper.selected.completed = true;
                //stepper.next();
            }, err => {
                console.log(err);
            });
    }

    getCompany(company : Company, stepper) {
        this.company = company;
        this.facility = false;
        this.company.groups.forEach((group) => {
            if (group.id == 2)
                this.facility = true;
        });
        stepper.selected.completed = true;
        stepper.next()
    }
    completed(stepper) { stepper.selected.completed = true; stepper.next()}
    postBooking(stepper) {
        if (this.bookingFormGroup.status == "INVALID")
            return;
        console.log(this.bookingFormGroup);
        let bookingObj = new Booking(
            this.bookingFormGroup.value.firstName,
            this.bookingFormGroup.value.lastName,
            this.bookingFormGroup.value.telephone,
            this.bookingFormGroup.value.email,
            this.company.id,
            this.selectedSport
        );
        console.log(bookingObj);
        this.api.postBooking(bookingObj)
            .subscribe(res => {
                console.log(res);
            }, err => {
                console.log(err);
            });
        stepper.selected.completed = true;
        stepper._steps._results.forEach(step => { step._editable = false });
    }

    getBackground(image) {
        return this._sanitizer.bypassSecurityTrustStyle(`url(${image})`);
    }

    getRatingLabel(rating) {
        if (rating >= 9) return "Eccellente";
        if (rating >= 8.6 && rating < 9) return "Favoloso";
        if (rating >= 8 && rating < 8.6) return "Ottimo";
        if (rating >= 7 && rating < 8) return "Buono";
        if (rating < 7) return "Medio";
    }

    getRatingStarsNumber(rating) {
        if (rating >= 9) return [1,2,3,4,5];
        if (rating >= 8.6 && rating < 9) return [1,2,3,4];
        if (rating >= 8 && rating < 8.6) return [1,2,3,4];
        if (rating >= 7 && rating < 8) return [1,2,3];
        if (rating < 7) return [1,2];
    }
}
