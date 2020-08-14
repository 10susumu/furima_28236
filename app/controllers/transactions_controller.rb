class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @transaction = ItemTransaction.new
  end
  
  def new
    @transaction = ItemTransaction.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @transaction = ItemTransaction.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      return redirect_to root_path
    else
      render :index
    end
  end
  
  def transaction_params
    params.require(:item_transaction).permit(:item_id, :user_id, :price, :token, :postal_code, :prefectures_id, :city, :address_line1, :address_line2, :phone_number).merge(token: params[:token])
  end

  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: transaction_params[:price],
      card: transaction_params[:token],
      currency:'jpy'
    )
  end
  
end

