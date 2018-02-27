class CustomerController < ApplicationController

  before_action :authenticate_admin!
  layout "admin"


  def index
    @customer_user = Customer.all
  end

  def new
    @customer_new = Customer.new
  end

  def create
    @customer_new = Customer.new(customer_user_params)
    if @customer_new.save
      flash[:notice] = "Klient: #{@customer_new.customer_nick} pomyślnie dodany"
      redirect_to(:action => "index")
    else
      render("new")
    end
  end

  def password_edit
    @customer_pwd = Customer.find(params[:id])
  end

  def password_update
    @customer_pwd = Customer.find(params[:id])
    if @customer_pwd.update_attributes(password_update_params)
      flash[:notice] = "Hasło użytkownika: #{@customer_pwd.customer_nick} zostało zmienione"
      redirect_to(:action => "edit", :id => @customer_pwd.id)
    else
      render("password_edit")
    end
  end

  def edit
    @customer_user = Customer.find(params[:id])
  end

  def update
    @customer_user = Customer.find(params[:id])
    if @customer_user.update_attributes(customer_user_params)
      flash[:notice] = "Dane klienta: #{@customer_user.customer_nick} pomyślnie zmienione"
      redirect_to(:action => "index")
    else
      render("edit")
    end
  end

  def delete
    @customer_del = Customer.find(params[:id])
  end

  def remove
    @customer_del = Customer.find(params[:id]).destroy
    flash[:notice] = "Klient o nazwie użytkownika: #{@customer_del.customer_nick} został pomyślnie usunięty"
    redirect_to(:action => "index")
  end

  private

    def customer_user_params
      params.require(:customer_user).permit(:name, :surename, :email, :customer_nick, :phone_no, :password, :password_confirmation)
    end

    def password_update_params
      params.require(:customer_pwd).permit(:password, :password_confirmation)
    end


end
