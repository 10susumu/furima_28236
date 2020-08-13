class TransactionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @transaction = Transaction.new
    @address = Address.new
    @user = User.new
  end
  
  def create
    @address = Address.create
    @user = User.create
    @item = Item.find(params[:item_id])
    # @transaction = Transaction.new(item_id: @item.id, user_id: current_user.id)
    @transaction = Transaction.new(item_id: transaction_params[:item_id], user_id: transaction_params[:user_id])
    binding.pry
    if @transaction.valid?
      pay_item
      return redirect_to root_path
    else
      render :index
    end
  end
  
  def transaction_params
    # params.permit(:token, :postal_code, :prefectures_id, :city, :address_line1, :address_line2, :phone_number)
    params.require(:transaction).permit(:price, :token, :item_id, :user_id)
  end

  def pay_item
    Payjp.api_key = "sk_test_260d06afb3631a1730f900d4"
    Payjp::Charge.create(
      amout: transaction_params[:price],
      card: transaction_params[:token],
      currency:'jpy'
    )
  end

end
