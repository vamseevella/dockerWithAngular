import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';

@Injectable()
export class LibService {
  constructor(private http: HttpClient) {
  }

  login(userDetails) {
    return this.http.post('http://localhost:9000/loginUser', userDetails);
  }

  signUp(signUpDetails) {
    return this.http.post('http://localhost:9000/createUser', signUpDetails);
  }

  createPersonalDetailsForUser(personalDetails) {
    return this.http.post('http://localhost:9000/CreatePersonalInfo', personalDetails);
  }

  getPersonalData(data) {
    return this.http.post('http://localhost:9000/GetPersonalInfo', data);
  }
}
