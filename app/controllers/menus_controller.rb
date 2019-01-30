class MenusController < ApplicationController
  
  def breakfast_menu
    if current_user.admin?
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 0)
      render layout: "admin_layout"
    else
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 0)
    end
  end

  def lunch_menu
    if current_user.admin?
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 1)
      render layout: "admin_layout"
    else
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 1)
    end
  end

  def happy_hour_menu
    if current_user.admin?
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 2)
      render layout: "admin_layout"
    else
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 2)
    end
  end

  def dinner_menu
    if current_user.admin?
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 3)
      render layout: "admin_layout"
    else
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 3)
    end
  end

  def latenight_menu
    if current_user.admin?
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 4)
      render layout: "admin_layout"
    else
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 4)
    end
  end

  def brunch_menu
    if current_user.admin?
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 5)
      render layout: "admin_layout"
    else
      @menus = Menu.where("availability = ? AND menu_type = ?", true, 5)
    end
  end


end
