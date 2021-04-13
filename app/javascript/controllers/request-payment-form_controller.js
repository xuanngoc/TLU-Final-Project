import { Controller } from "stimulus";
import randomstring from "randomstring";
import axios from "axios";

export default class extends Controller {

  connect() {
    this.listReceipt = document.getElementById('listReceipt');

    axios.get(`/api/v1/cost_types`)
    .then((response) => {
      this.listCostTypes = response.data;
      console.log(this.listCostTypes);
    });

  }

  showEReceiptForm(event) {
    event.preventDefault();

    const param_id = randomstring.generate(7);

    const select_tag = `
      <div class="ml-3 row form-group">
        <label>Loại chi phí</label>
        <select class=" col-12 form-control" name="e_receipt[${param_id}][cost_type_id]">
          ${this.generateOptionsCostType()}
        </select>
      </div>
    `;



    const form_builder = `
      <div class="ml-5 mr-5">
        <h6 class="font-weight-bold">➢ Thông tin hóa đơn</h6>
        ${select_tag}
        <div class="ml-2 row">
          <div class="col-6 form-group">
            <label>Mã số thuế người bán</label>
            <input name="e_receipt[${param_id}][tax_number]" class="form-control" placeholder="0101825712" required  />
          </div>
          <div class="col-6 form-group">
            <label>Mẫu số</label>
            <input name='e_receipt[${param_id}][template_number]' class="form-control" placeholder="01GTKT0/001" required  />
          </div>
        </div>
        <div class="ml-2 row">
          <div class="col-6 form-group">
            <label>Ký hiệu hóa đơn</label>
            <input name='e_receipt[${param_id}][symbols]', class="form-control" placeholder="AA/19E" required />
          </div>
          <div class="col-6 form-group">
            <label>Số hóa đơn</label>
            <input name='e_receipt[${param_id}][receipt_number]', class="form-control" placeholder="0026902" required />
          </div>
        </div>
      </div>
    `;
    this.listReceipt.insertAdjacentHTML('afterend', form_builder);
  }


  showNoReceiptForm(event) {
    event.preventDefault();
    console.log("hehe1");

  }

  generateOptionsCostType() {
    let options = "";
    this.listCostTypes.forEach(type => {
      options += `<option value="${type.id}">${type.name}</option>\n`
    });
    return options;
  }
}
