/* { "uuid": "bba5fa3b-e6d0-4d40-87dc-43350d6e3cc4", "pk": 8, "email": "alessandro@madfarm.it", "feedback": { "closeness":0, "punctuality":0, "value_for_money": 0, "skill": 0, "cleaning": 0, "passion": 0, "booking": 8}} */

import { Feedback } from './feedback';

export class FeedbackRequest {
    uuid : string;
    pk : number;
    feedback : Feedback;

    constructor(uuid: string, pk: number, feedback: Feedback) {
        this.uuid = uuid;
        this.pk = pk;
        this.feedback = feedback;
    }
}
