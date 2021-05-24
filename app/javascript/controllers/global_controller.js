import { Controller } from "stimulus";
import autocomplete from "autocomplete.js";
import axios from "axios";

export default class extends Controller {

  connect() {
    var list = document.getElementsByClassName('currency');
    for (let item of list) {
      item.textContent = this.formatCurrency(item.textContent)
    }
  }

  formatCurrency(text) {
    return text.replace(/\B(?=(\d{3})+(?!\d))/g, ', ')
  }

}
