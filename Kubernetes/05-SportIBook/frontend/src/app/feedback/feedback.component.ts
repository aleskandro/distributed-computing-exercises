import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApiService } from '../api.service';
import { Company } from '../models/company';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Feedback } from '../models/feedback';
import { FeedbackRequest } from '../models/feedback-request';
@Component({
  selector: 'app-feedback',
  templateUrl: './feedback.component.html',
  styleUrls: ['./feedback.component.css']
})
export class FeedbackComponent implements OnInit {
    id = undefined;
    uuid = undefined;
    company = new Company();
    valid = false;
    facility = false;
    completed = false;
    verified = false;
    feedbackFormGroup: FormGroup;
    feedback : Feedback;
    constructor(private route : ActivatedRoute, private api : ApiService, private _formBuilder: FormBuilder) { }

    ngOnInit() {
        this.id = parseInt(this.route.snapshot.paramMap.get("id"));
        this.uuid = this.route.snapshot.paramMap.get("uuid");

        this.feedback = new Feedback(0,0,0,0,0,0,this.id);

        let that = this;
        this.api.getCompanyByBooking(this.id, this.uuid)
            .subscribe(res => {
                that.company = res;
                if (that.company["id"]) {
                    that.valid = true;
                    that.company.groups.forEach((group) => {
                    if (group.id == 2)
                        that.facility = true;
                    });
                }
                this.verified = true;
            }, err => {
                console.log(err);
                this.verified = true;
            });
    }

    submitFeedback() {
        //constructor(cleaning: number, closeness: number, value_for_money: number, punctuality: number, passion:number, skill:number, booking:number) {
        console.log(this.feedbackFormGroup);
        // constructor(uuid: string, pk: number, feedback: Feedback) {
        let feedbackRequest = new FeedbackRequest(this.uuid, this.id, this.feedback);
        this.api.postFeedback(feedbackRequest)
            .subscribe(res => {
                console.log(res);
                this.completed = true;
            }, err => {
                console.log("error")
                console.log(err);
            });
    }

    goBack() {
        this.completed = false;
    }
}
