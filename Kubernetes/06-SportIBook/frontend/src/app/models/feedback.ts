/* { "uuid": "bba5fa3b-e6d0-4d40-87dc-43350d6e3cc4", "pk": 8, "email": "alessandro@madfarm.it", "feedback": { "closeness":0, "punctuality":0, "value_for_money": 0, "skill": 0, "cleaning": 0, "passion": 0, "booking": 8}} */

export class Feedback {
    cleaning:  number;
    motivation: number;
    value_for_money: number;
    professionality: number;
    passion: number;
    skill: number;
    booking: number;
    constructor(cleaning: number, motivation: number, value_for_money: number, professionality: number, passion:number, skill:number, booking:number) {
        this.cleaning = cleaning;
        this.motivation = motivation;
        this.value_for_money = value_for_money;
        this.professionality = professionality;
        this.passion = passion;
        this.skill = skill;
        this.booking = booking;
    }
}
