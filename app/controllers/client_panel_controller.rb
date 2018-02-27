class ClientPanelController < ApplicationController
  before_action :authenticate_customer!
  layout "client_panel"


  def my_account
    @client_info = Customer.find(current_customer.id)
    @client_bookings = Booking.all
  end

  def account_edit
    @client_info = Customer.find(current_customer.id)
  end

  def account_update
    @client_info = Customer.find(current_customer.id)
    if @client_info.update_attributes(account_params)
      flash[:notice] = "Twoje dane zostały zapisane"
      redirect_to(:action => "account_edit")
    else
      render("account_edit")
    end
  end

  def password_edit
    @client_pwd = Customer.find(current_customer.id)
  end

  def password_update
    @client_pwd = Customer.find(current_customer.id)
    if @client_pwd.update_with_password(password_update_params)
      sign_in @client_pwd, :bypass => true
      flash[:notice] = "Twoje hasło zostało zmienione"
      redirect_to(:action => "account_edit")
    else
      render("password_edit")
    end
  end

  def my_booking
    @bookings = Booking.where(:customer_id => current_customer.id)
    @lp = 0
    @client_info = Customer.find(current_customer.id)
  end

  def new
    @client_info = Customer.find(current_customer.id)
  end

  def create
    @reserv_new = Booking.new(booking_params)
    if @reserv_new.save
      flash[:notice] = "Rezerwacja nr: #{@reserv_new.id} została zapisana"
      redirect_to(:action => "my_booking")
    else
      render("new")
    end
  end

  def edit
    @reservation = Booking.find(params[:id])
    @client_info = Customer.find(current_customer.id)
  end

  def update
    @reservation = Booking.find(params[:id])
    if @reservation.update_attributes(booking_params)
      flash[:notice] = "Dane rezerwacji nr: #{@reservation.id} zostały zmienione"
      redirect_to(:action => "my_booking")
    else
      render("edit")
    end
  end

  def delete
    @reserv_del = Booking.find(params[:id])
  end

  def remove
    @reserv_del = Booking.find(params[:id]).destroy
    flash[:notice] = "Rezerwacja nr: #{@reserv_del.id} została usunięta"
    redirect_to(:action => "my_booking")
  end

  private

  def booking_params
    params.require(:reservation).permit(:customer_name, :customer_surename, :phone_no, :customer_id, :table_id, :booking_data, :booking_hour_start, :booking_hour_end, :comment)
  end

  def account_params
    params.require(:client_info).permit(:name, :surename, :customer_nick, :email, :phone_no)
  end

  def password_update_params
    params.require(:client_pwd).permit(:password, :password_confirmation, :current_password)
  end

end
