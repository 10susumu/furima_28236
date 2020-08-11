class ItemsController < ApplicationController
  before_action :redirect_root, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order("created_at DESC")

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
  
  def show
  end
  
  def edit
  end
  
  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def item_params
    params.require(:item).permit(:images, :name, :description, :category_id, :status_id, :shipping_charges_id, :shipping_region_id, :day_until_shipping_id, :price).merge(user_id: current_user.id)
  end
  
  private
  
  def redirect_root
    redirect_to root_path unless user_signed_in?
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

end
