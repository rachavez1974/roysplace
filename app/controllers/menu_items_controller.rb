class MenuItemsController < ApplicationController
layout "admin_layout"
#Other Function definitions live in appplicaiton controller file and module helpers
before_action :logged_in_admin
before_action :admin_user
before_action :find_item, except: [:new]
  
  def show
    if @item.nil?
      flash.now[:danger] = "Menu item not found, please try again!"
      render 'menu_items/search_form'
    end
  end

  def new
    @item = MenuItem.new
  end

  def create
    @item = MenuItem.new(item_menu_params)
      if @item.save
        flash[:success] = "#{@item.name} was added successfully to your menu!"
        redirect_to @item
      else
        render 'new'
      end
  end

  def edit
  end

  def update
    if @item.update_attributes(item_menu_params)
      flash[:success] = "#{@item.name} information has been updated!" 
      redirect_to @item
    else
      render 'edit'
    end
  end
  
  def destroy
    @item.destroy
    flash[:success] = "The item #{@item.name} has been deleted from menu!"
    redirect_to admin_root_url  
  end

  private

  def item_menu_params
    params.require(:menu_item).permit(:name, :description, :price, :section, :availability, :menu_type)
  end

  def find_item
    @item = MenuItem.find_by("id = ? OR name = ?",  id, name)
  end

  def name
     params[:name]  
  end

  def id
    params[:id]
  end  
end
