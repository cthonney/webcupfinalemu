import { Controller } from "@hotwired/stimulus"

// Fonction pour fermer le popup
function closeAlert() {
  document.getElementById('custom-alert').style.display = "none";
}

export default class extends Controller {
  sendAlert(event) {
    const alertType = event.target.dataset.alertType;
    const message = `Emergency Alert --> ${alertType}`;

    // Mettre à jour le message dans le popup
    document.getElementById('custom-alert-message').innerText = `Sent to population : ${message}`;

    // Afficher le popup
    const alertElement = document.getElementById('custom-alert');
    alertElement.style.display = "block";

    // Fermer le popup après 3 secondes
    setTimeout(() => {
      closeAlert();
    }, 3000);
  }
}
