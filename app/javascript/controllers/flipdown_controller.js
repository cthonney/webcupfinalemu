import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flipdown"
export default class extends Controller {
  static targets = ["countdown"];
  static values = {
    timer: Number,
  };

  connect() {
    console.log("Connected to countdown controller");

    this.secondsUntilEnd = this.timerValue;

    const now = new Date().getTime();
    this.endTime = new Date(now + this.secondsUntilEnd * 1000);

    this.countdown = setInterval(this.countdown.bind(this), 950);
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
    const hours = Math.floor(
      (secondsRemaining % secondsPerDay) / secondsPerHour
    );
    const minutes = Math.floor(
      (secondsRemaining % secondsPerHour) / secondsPerMinute
    );
    const seconds = Math.floor(secondsRemaining % secondsPerMinute);

    this.countdownTarget.innerHTML = `
      <div class="time hour">${hours}</div>
      <div class="time minute">${minutes}</div>
      <div class="time second">${seconds}</div>
    `;
  }
}
