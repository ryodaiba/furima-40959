class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item(@item.price, purchase_params[:token])
      @purchase_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item(amount, token)
    Payjp.api_key = "sk_test_12961de93ee1b02f21d39f65" # PAY.JPシークレットキー
    Payjp::Charge.create(
      amount: amount,           # 支払い金額
      card: token,              # token
      currency: 'jpy'           # 通貨単位
    )
  end

end