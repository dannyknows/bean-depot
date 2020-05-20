class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def get_stripe_id
    @products = current_user.carts.find_by(fulfilled: false).products
    line_items = @products.map do |product|
      {
        name: product.name,
        amount: product.price,
        currency: 'aud',
        quantity: 1,
      }
    end
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [line_items],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          listing_id: current_user.fname
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&cartId=#{@current_}",
      cancel_url: "#{root_url}/cart"
    ).id
    render :json => {id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key)}
  end


  def success


  end

  def webhook
      p params
  end
  private
end

