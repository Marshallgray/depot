module CurrentCart
  extend ActiveSupport::Concern

  private

  def set_cart
    # session is the connection between a user and a browser
    @cart = Cart.find(session[:cart_id])
    # going to the cart to find a cart_id
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    # if user hasn't created a cart then this will create a cart
    session[:cart_id] = @cart.id
  end

end
