class CheckoutController < ApplicationController
  def index
  end

  def create
    customer = {
      name: "#{params[:first_name]} #{params[:last_name]}",
      email: params[:email]
    }
    response = moltin.carts.checkout(cart_ref, customer: customer,
                                               billing_address: fake_address,
                                               shipping_address: fake_address)
    p response
  end

  def payment

  end

  def pay

  end

  private

  def fake_address
    {
      "first_name": "Jack",
      "last_name": "Macdowall",
      "company_name": "Macdowalls",
      "line_1": "1225 Invention Avenue",
      "line_2": "Birmingham",
      "postcode": "B21 9AF",
      "county": "West Midlands",
      "country": "UK"
    }
  end
end
