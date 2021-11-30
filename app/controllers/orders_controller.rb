class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_order, only: [:index, :create]
  # before_action :prevent_url, only: :index

  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_shipping_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_shipping_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_shipping_params[:token],
      currency: 'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  # def prevent_url
  #   if @item.purchase != nil
  #     redirect_to root_path
  #   end
  # end

end
