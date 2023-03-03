import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "checkInDate", "checkOutDate", "totalPrice" ]
  static values = {
    dayRate: Number
  }

  connect() {
    console.log(this.dayRateValue)
    const unvailableDates = JSON.parse(document.getElementById("island-booking-dates").dataset.unavailable)
    // console.log("15:54")
    flatpickr(this.checkInDateTarget, {
      disable: unvailableDates,
      // Provide an id for the plugin to work
      plugins: [new rangePlugin({ input: "#checkOutDate"})],
      onChange: function(selectedDates, dateStr, instance) {
        const date1 = new Date(selectedDates[0]);
        if (selectedDates[1]) {
          const date2 = new Date(selectedDates[1]);
          const diffTime = Math.abs(date2 - date1);
          const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
          console.log(this.dayRateValue * diffDays)
          const totalPrice = this.dayRateValue * diffDays;
          this.totalPriceTarget.innerHTML = totalPrice
        }
      }.bind(this),
    })
    flatpickr(this.checkOutDateTarget, {
      disable: unvailableDates,
      onChange: function(selectedDates, dateStr, instance) {
        console.log(selectedDates)
      },
    })
  }
}
