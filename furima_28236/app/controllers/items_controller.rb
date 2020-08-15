class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def item_params
    params.require(:item).permit(:images, :name, :description, :category_id, :status_id, :shipping_charges_id, :prefectures_id, :day_until_shipping_id, :price).merge(user_id: current_user.id)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
