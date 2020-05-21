class PaymentsController < ApplicationController
  before_action :current_cart

  def get_stripe_id
    @products = @cart.products
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
      line_items: line_items,
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          listing_id: current_user.fname
        }
      },
      success_url: "#{root_url}payments/success?user=#{current_user.id}&cartId=#{@cart.id}",
      cancel_url: "#{root_url}/cart"
    ).id
    render :json => { id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key) }
  end

  def success
    flash[:success] = "👏 purchase was successful"
    @cart.update(fulfilled: true)
    redirect_to root_path
  end

  private
  def current_cart
    @cart = Cart.find_by(user_id: current_user.id, fulfilled: false)
  end
end
