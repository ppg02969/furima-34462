class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:edit]

  def index
    @item = Item.find(params[:item_id])
    @user_buyer = UserBuyer.new
  end

  def create
    #binding.pry
    @item = Item.find(params[:item_id])
    @user_buyer = UserBuyer.new(buyer_params)
    if @user_buyer.valid?
      pay_item
      @user_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

private

  def buyer_params
    params.require(:user_buyer).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    unless @item.user == current_user
      redirect_to root_path
    end
  end
end

# params

# ①１重パラメーター
# {postal_code: "123-4567", area_id: "4"}
# params.permit(:postal_code, :area_id)

# ②２重のパラメーター
# {order: {postal_code: "123-4567", area_id:"5"}}
# params.require(:order).premit(:postal_code, :area_id)

# ③混ざったパラーメーター
# {order: {postal_code: "123-4567", area_id: "5"}, item_id: "9"}
# params.require(:order).permit(:postal_code, :area_id).merge(~~~~)