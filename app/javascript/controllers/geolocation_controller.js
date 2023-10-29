import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geolocation"
export default class extends Controller {
  static targets = ["location"];

  static values = {
    apiKey: String
  };

  connect() {
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(
        this.handleGeoLocationSuccess.bind(this),
        this.handleGeoLocationError.bind(this)
      );

    } else {
    }
  }

  handleGeoLocationSuccess(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;

    // You can now use the latitude and longitude as needed

    const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${longitude},${latitude}.json?access_token=${this.apiKeyValue}`;

    fetch(url)
      .then((response) => {
        if (!response.ok) {
          throw new Error("Network response was not ok");
        }
        return response.json();
      })
      .then((data) => {
        // Handle the data here, e.g., display it on the page
        this.locationTarget.innerHTML = `
          , you're in ${data?.features[1].place_name}
        `;
      })
      .catch((error) => {
      });









  }

  handleGeoLocationError(error) {
    switch (error.code) {
      case error.PERMISSION_DENIED:
        break;
      case error.POSITION_UNAVAILABLE:
        break;
      case error.TIMEOUT:
        break;
      default:
    }
  }
}
