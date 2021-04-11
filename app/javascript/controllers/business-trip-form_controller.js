import { Controller } from "stimulus";
import autocomplete from "autocomplete.js";
import axios from "axios";

export default class extends Controller {
  static targets = ["searchText"];

  search(query, callback) {
    axios.get(`/api/v1/personnels`,
     {
      params: {
         name: query
      }
    }).then((response) => {
      callback(response.data);
    });
  }

  connect() {
    this.listPersonnel = document.getElementById('list-personnels');

    this.ac = autocomplete(this.searchTextTarget, { hint: false }, [
      {
        source: this.search,
        debounce: 200,
        templates: {
          suggestion: function (suggestion) {
            return `${suggestion.full_name} - ${suggestion.department}`;
          },
        },
      },
    ]).on("autocomplete:selected", (event, suggestion, dataset, context) => {
      const personnel = `
        <div>
          <span class="ml-5" >+ ${suggestion.code} - ${suggestion.full_name}
            <i class="far fa-times-circle ml-3" data-action='click->business-trip-form#removePersonnel'></i>
          </span>
          <input name="list_personnel[]" type="hidden" value="${suggestion.id}" />
        </div>`;
      this.listPersonnel.innerHTML = this.listPersonnel.innerHTML + personnel;
      this.searchTextTarget.value = "";
    });
  }

  removePersonnel(e) {
    e.target.parentNode.remove();
  }
}
