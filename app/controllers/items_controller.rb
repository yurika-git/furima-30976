class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    # @item = Item.find(item_params[:user_id])
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

  private

  def item_params
    params.require(:item).permit(:product, :description, :category_id, :condition_id, :charge_id, :area_id, :shipping_id, :price, :image).merge(user_id: current_user.id)
  end
end
