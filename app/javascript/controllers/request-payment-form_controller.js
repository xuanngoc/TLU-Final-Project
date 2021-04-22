import { Controller } from "stimulus";
import axios from "axios";

export default class extends Controller {

  connect() {
    this.tableEReceipt = document.getElementById('table-EReceipt').getElementsByTagName('tbody')[0];
    this.tableNoReceipt = document.getElementById('table-NoReceipt').getElementsByTagName('tbody')[0];

    this.rowNumbers = this.tableEReceipt.rows.length
    this.rowNoNumbers = this.tableEReceipt.rows.length

    axios.get(`/api/v1/cost_types`)
    .then((response) => {
      this.listCostTypes = response.data;
      console.log(this.listCostTypes);
    });

  }

  showEReceiptForm(event) {
    event.preventDefault();

    const row_builder = `
      <tr>
        <th scope='col' style="width: 5%;">${++this.rowNumbers}</th>
        <td class=" form-group " style="width: 15%;">
          <select class="form-control" name="e_receipt[][cost_type_id]">
          ${this.generateOptionsCostType()}
          </select>
        </td>
        <td class=" form-group">
          <input name="e_receipt[][tax_number]" class="form-control" placeholder="0101825712" required  />
        </td>
        <td class=" form-group">
          <input name='e_receipt[][template_number]' class="form-control" placeholder="01GTKT0/001" required  />
        </td>
        <td class=" form-group">
          <input name='e_receipt[][symbols]', class="form-control" placeholder="AA/19E" required />
        </td>
        <td class=" form-group">
          <input name='e_receipt[][receipt_number]', class="form-control" placeholder="0026902" required />
        </td>
        <td class=" form-group" style="width: 15%;">
          <input type='number' name="e_receipt[][amount]" class="form-control" required  />
        </td>
      </tr>
    `;

    const newRow = this.tableEReceipt.insertRow()
    newRow.innerHTML = row_builder;
  }


  showNoReceiptForm(event) {
    event.preventDefault();

    const row_builder = `
      <tr>
        <th scope='col' style="width: 5%;">${++this.rowNoNumbers}</th>
        <td class=" form-group " style="width: 15%;">
          <select class="form-control" name="no_receipt[][cost_type_id]">
          ${this.generateOptionsCostType()}
          </select>
        </td>

        <td class="form-group ">
          <input type='number' name="no_receipt[][amount]" class="form-control"  style="float: right; width: 17%" required  />
        </td>
      </tr>
    `;

    const newRow = this.tableNoReceipt.insertRow()
    newRow.innerHTML = row_builder;
  }

  generateOptionsCostType() {
    let options = "";
    this.listCostTypes.forEach(type => {
      options += `<option value="${type.id}">${type.name}</option>\n`
    });
    return options;
  }
}
