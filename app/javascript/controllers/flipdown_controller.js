import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flipdown"
export default class extends Controller {
  static targets = ["countdown"];
  static values = {
    timer: Number,
  };

  connect() {

    this.secondsUntilEnd = this.timerValue;

    const now = new Date().getTime();
    this.endTime = new Date(now + this.secondsUntilEnd * 1000);

    this.countdown = setInterval(this.countdown.bind(this), 950);
  }

  addLeadingZero(number) {
    // Convert the number to a string
    let numberString = number.toString();

    // Check if it's a single digit
    if (numberString.length === 1) {
      // Add a leading zero
      numberString = "0" + numberString;
    }

    return numberString;
  }


  countdown() {
    const now = new Date();
    const secondsRemaining = (this.endTime - now) / 1000;

    if (secondsRemaining <= 0) {
      clearInterval(this.countdown);
      this.countdownTarget.innerHTML = "Countdown is over!";
      return;
    }

    const secondsPerDay = 86400;
    const secondsPerHour = 3600;
    const secondsPerMinute = 60;

    const days = Math.floor(secondsRemaining / secondsPerDay);
    let hours = Math.floor(
      (secondsRemaining % secondsPerDay) / secondsPerHour
    );
    let minutes = Math.floor(
      (secondsRemaining % secondsPerHour) / secondsPerMinute
    );
    let seconds = Math.floor(secondsRemaining % secondsPerMinute);

    this.countdownTarget.innerHTML = `
      <div class="time hour">
        ${this.addLeadingZero(hours)}
        <span class="type">Hours</span>
      </div>
      <div class="time minute">
        ${this.addLeadingZero(minutes)}
        <span class="type">Minutes</span>
      </div>
      <div class="time second">
        ${this.addLeadingZero(seconds)}
        <span class="type">Seconds</span>
      </div>
    `;
  }
}
