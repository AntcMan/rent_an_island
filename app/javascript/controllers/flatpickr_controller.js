import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "checkInDate", "checkOutDate" ]

  connect() {
    const unvailableDates = JSON.parse(document.getElementById("island-booking-dates").dataset.unavailable)
    console.log("15:54")
    flatpickr(this.checkInDateTarget, {
      disable: unvailableDates,
      // Provide an id for the plugin to work
      plugins: [new rangePlugin({ input: "#checkOutDate"})]})
    flatpickr(this.checkOutDateTarget, {
      disable: unvailableDates
    })
  }
}
