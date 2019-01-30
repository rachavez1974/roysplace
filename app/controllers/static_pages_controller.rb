class StaticPagesController < ApplicationController
  def home
     if breakfast_time?
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 0)
    elsif lunch_time?
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 1)
    elsif happy_hour_time? && dinner_time?
      @menus = MenuItem.where("availability = ? AND menu_type = ? OR menu_type = ?", true, 2, 3)
    elsif dinner_time?
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 3)
    elsif latenight_time?
      @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 4)      
    else
      if brunch_time?
        @menus = MenuItem.where("availability = ? AND menu_type = ?", true, 5)
      end
    end
  end

  def about
  end

  def contact
  end

  def menus
  end

  def offers
  end

  def bagged
  end
end
