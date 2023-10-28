import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disaster"
export default class extends Controller {
  connect() {
    console.log("Hello from the disaster controller");
  }
}
