class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    def check_login
      unless session[:admin_user_id]
        flash[:notice] = "Nie jesteś zalogowany"
        redirect_to(:controller => "admin_access", :action => "login")
        return false
      else
        return true
      end
    end
end
