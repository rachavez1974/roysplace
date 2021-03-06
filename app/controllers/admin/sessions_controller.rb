class Admin::SessionsController < ApplicationController
layout "admin_layout"
before_action :redirect_to_admin_root, :if => :logged_in?, only: :new

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.admin? && @user.authenticate(params[:session][:password]) 
          if @user.activated? 
          log_in(@user)
          params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
          flash[:success] = "Welcome back #{@user.first_name}"   
          redirect_back_or admin_root_url
        else
          message  = "Account not activated."
          message += "Please check with your network manager."
          flash[:warning] = message
          redirect_to admin_root_url
        end
      else
          flash.now[:danger] = 'Invalid email/password combination for admin.'
          render  'new'
      end     
  end

  def destroy
    log_out if logged_in?
    redirect_to admin_login_url
  end

  private

  def redirect_to_admin_root
    redirect_to admin_root_url  
  end
end
