class Admin::DashboardController < ApplicationController
  layout "admin_layout"
  before_action :logged_in_admin, except: [:home]
  before_action :admin_user, except: [:home]

  def home
  end

  def breakfast_menu
    
  end
  
end
