class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    if current_user.id == @item.user_id || @item.purchase.present?
      redirect_to root_path
    end
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPシークレットキー
    Payjp::Charge.create(
      amount: amount,           # 支払い金額
      card: token,              # token
      currency: 'jpy'           # 通貨単位
    )
  end

end