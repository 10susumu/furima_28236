class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new
    @address = Address.new
    @user = User.new
  end
  
  def create
    @address = Address.new
    @user = User.new
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new(item_id: transaction_params[:item_id], user_id: transaction_params[:user_id])
    # binding.pry
    if @transaction.valid?
      pay_item
      @transaction.save
      return redirect_to root_path
    else
      render :index
    end
  end
  
  def transaction_params
    params.require(:transaction).permit(:item_id, :user_id, :price, :token).merge(token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = "sk_test_260d06afb3631a1730f900d4"
    Payjp::Charge.create(
      amount: transaction_params[:price],
      card: transaction_params[:token],
      currency:'jpy'
    )
  end
  
end
# params.permit(:token, :postal_code, :prefectures_id, :city, :address_line1, :address_line2, :phone_number)