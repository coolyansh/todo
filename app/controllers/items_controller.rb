class ItemsController < ApplicationController

  def index
    @items_current = Item.where('due_date >= ?', Date.today).order(due_date: :asc)
    @items_expired = Item.where('due_date < ?', Date.today).order(due_date: :desc)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item =Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private
    def item_params
      params.require(:item).permit(:title, :description, :due_date, :priority)
    end

end
