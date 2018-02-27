class AdminController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  def index
    @admin_user = Admin.all
  end

  def new
    @admin_new = Admin.new
  end

  def create
    @admin_new = Admin.new(admin_user_params)
    if @admin_new.save
      flash[:notice] = "Administrator #{@admin_new.admin_nick} pomyślnie dodany"
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def password_edit
    @admin_pwd = Admin.find(params[:id])
  end

  def password_update
    @admin_pwd = Admin.find(params[:id])
    if @admin_pwd.update_with_password(password_update_params)
      sign_in @admin_pwd, :bypass => true
      flash[:notice] = "Twoje hasło zostało zmienione"
      redirect_to(:action => "index")
    else
      render("password_edit")
    end
  end


  def edit
    @admin_user = Admin.find(params[:id])
  end


  def update
    @admin_user = Admin.find(params[:id])
    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = "Admin user successfully updated"
      redirect_to(:action => "index")
    else
      render("edit")
    end
  end

  def delete
    @admin_del = Admin.find(params[:id])
  end

  def remove
    @admin_del = Admin.find(params[:id]).destroy
    flash[:notice] = "Aministrator o nazwie użytkownika: #{@admin_del.admin_nick} został pomyślnie usunięty"
    redirect_to(:action => "index")
  end

  private

    def admin_user_params
      params.require(:admin_user).permit(:name, :surename, :email, :admin_nick, :password, :password_confirmation)
    end

    def password_update_params
      params.require(:admin_pwd).permit(:password, :password_confirmation, :current_password)
    end

end
