import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geolocation"
export default class extends Controller {
  static targets = ["location"];

  static values = {
    apiKey: String
  };

  connect() {
    console.log("connected to the controller", this.locationTarget);
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(
        this.handleGeoLocationSuccess.bind(this),
        this.handleGeoLocationError.bind(this)
      );

    } else {
      console.error("Geolocation is not available in this browser.");
    }
  }

  handleGeoLocationSuccess(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;

    // You can now use the latitude and longitude as needed
    console.log("Latitude: " + latitude);
    console.log("Longitude: " + longitude);



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
        console.log();
        this.locationTarget.innerHTML = `
          , you're in ${data?.features[1].place_name}
        `;
      })
      .catch((error) => {
        console.error("Fetch error: ", error);
      });









  }

  handleGeoLocationError(error) {
    switch (error.code) {
      case error.PERMISSION_DENIED:
        console.error("User denied the request for geolocation.");
        break;
      case error.POSITION_UNAVAILABLE:
        console.error("Location information is unavailable.");
        break;
      case error.TIMEOUT:
        console.error("The request to get user location timed out.");
        break;
      default:
        console.error("An unknown error occurred.");
    }
  }
}
