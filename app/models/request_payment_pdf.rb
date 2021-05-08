require "render_anywhere"

class RequestPaymentPdf
  include RenderAnywhere

  def initialize(request_payment)
    @request_payment = request_payment
  end

  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/public/request_payment.pdf")
  end

  def filename
    "Report Request payemtn 000#{request_payment.id}.pdf"
  end

  private

  attr_reader :request_payment

  def as_html
    # render template: "/pdfs/request_payment_pdf.html.erb", layout: "/request_payment_pdf.htm.erb", locals: { request_payment: request_payment }

    ActionController::Base.new.render_to_string(
      template: '/pdfs/request_payment_pdf.html.erb',
      layout: 'request_payment_pdf.html.erb',
      locals: { request_payment: request_payment }
    )

  end

end
