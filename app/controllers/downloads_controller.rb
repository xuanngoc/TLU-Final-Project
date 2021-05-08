class DownloadsController < ApplicationController

  def show
    respond_to do |format|
      format.pdf { send_request_payment_pdf }
    end
  end

  private

  def request_payment_pdf
    request_payment = RequestPayment.find(params[:report_request_payment_id])
    RequestPaymentPdf.new(request_payment)
  end

  def send_request_payment_pdf
    send_file request_payment_pdf.to_pdf,
      filename: request_payment_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end
end
