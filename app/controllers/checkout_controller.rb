class CheckoutController < ApplicationController
  def index
  end

  def create
    customer = {
      name: "#{params[:first_name]} #{params[:last_name]}",
      email: params[:email]
    }
    order = cart.checkout(customer: customer,
                          billing_address: fake_address,
                          shipping_address: fake_address).data
    session[:order_id] = order.id
    session[:first_name] = params[:first_name]
    session[:last_name] = params[:last_name]
    redirect_to payment_path
  end

  def payment
  end

  def pay
    payment = moltin.orders.get(session[:order_id]).pay({
      gateway: 'stripe',
      method: 'purchase',
      first_name: session[:first_name],
      last_name: session[:last_name],
      number: params[:card_number],
      month: params[:card_expiry].split('/')[0],
      year: params[:card_expiry].split('/')[1],
      verification_value: params[:card_cvc]
    })

    redirect_to confirm_path
  end

  def confirm
    session.delete(:cart_id)
    session.delete(:order_id)
    session.delete(:first_name)
    session.delete(:last_name)
  end

  private

  # Using a fake address since we send digital products
  # and don't want to bother the user with that. An email is enough
  # to deliver the products.
  def fake_address
    {
      first_name: 'Jack',
      last_name: 'Macdowall',
      company_name: 'Macdowalls',
      line_1: '1225 Invention Avenue',
      line_2: 'Birmingham',
      postcode: 'B21 9AF',
      county: 'West Midlands',
      country: 'UK'
    }
  end
end
