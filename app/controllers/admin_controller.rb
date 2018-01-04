class AdminController < ApplicationController

  layout "main"
  before_action :check_login

  def index
    @admin_user = AdminUser.sort_by_name
  end

  def show
  end

  def new
    @admin_new = AdminUser.new
  end

  def create
    @admin_new = AdminUser.new(admin_user_params)
    if @admin_new.save
      flash[:notice] = "Administrator #{@admin_new.admin_nick} pomyślnie dodany"
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = "Admin user successfully updated"
      redirect_to(:action => "index")
    else
      render("edit")
    end
  end

  def delete
    @admin_del = AdminUser.find(params[:id])
  end

  def remove
    @admin_del = AdminUser.find(params[:id]).destroy
    flash[:notice] = "dministrator o nazwie użytkownika: #{@admin_del.admin_nick} został pomyślnie usunięty"
    redirect_to(:action => "index")
  end

  private

    def admin_user_params
      params.require(:admin_user).permit(:name, :surename, :email, :admin_nick, :password, :password_confirmation)
    end

end
