class AdminAccessController < ApplicationController

  layout "login"

  before_action :check_login, :except => [:login, :admin_login, :logout]

  def login
  end

  def admin_login
    if params[:admin_user].present? && params[:password].present?
    admin_user_find = AdminUser.where(:admin_nick => params[:admin_user]).first
      if admin_user_find
        login_passed = admin_user_find.authenticate(params[:password])
      end
    end

    if login_passed
    session[:admin_user_id] = login_passed.id
    session[:admin_user] = login_passed.admin_nick
    flash[:notice] = "Zostałeś poprawnie zalogowany"
    redirect_to(:action => "index", :controller => "admin")
    else
    flash[:notice] = "Nieudane logowanie. Sprawdź nazwę użutkownika i hasło..."
    end
  end

  def logout
  session[:admin_user_id] = nil
  session[:admin_user] = nil
  flash[:notice] = "Zostałeś poprawnie wylogowany"
  redirect_to(:action => "login")
  end
end
