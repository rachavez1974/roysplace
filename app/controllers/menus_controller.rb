class MenusController < ApplicationController 

  def current_menu 
    @menus = MenuItem.current_menu_items(current_menu_params)
    resolve_layout
  end

  private
    def current_menu_params
      params[:menu]
    end

    def resolve_layout
       if User.is_admin?(current_user)
        render layout: "admin_layout"
      else
        render layout: "application"
      end
    end
  
end
