export class Booking {
    first_name: string;
    last_name: string;
    telephone: string;
    email: string;
    company: number;
    sport: number;
    constructor(first_name: string, last_name:string, telephone:string, email: string, company: number, sport:number) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.telephone = telephone;
        this.email = email;
        this.company = company;
        this.sport = sport;
    }
}
