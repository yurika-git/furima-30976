class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]
  before_action :set_items, only: [:show, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
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
    if @item.update(item_params)
     redirect_to action: :show
    else
     render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:product, :description, :category_id, :condition_id, :charge_id, :area_id, :shipping_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user == @item.user
  end
end
