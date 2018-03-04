class BookingController < ApplicationController
  before_action :authenticate_admin!, except: [:new, :create, :show]
  layout "admin"
  # before_action :check_login

  def index
    @bookings = Booking.sort_by_date
    @lp = 0

  end

  def show
    @reservation = Booking.find(params[:id])
  end

  def new
    @reservation = Booking.new
  end

  def new_exist_customer
    @customer_exist = Customer.find(params[:id])
  end

  def create
    @reservation = Booking.new(booking_params)
    if @reservation.save
      flash[:notice] = "Rezerwacja nr: #{@reservation.id} została zapisana"
      if admin_signed_in? || customer_signed_in?
        redirect_to(:action => "index")
      else
        render("show")
      end
    else
      render("new")
    end
  end

  def edit
    @reservation = Booking.find(params[:id])
  end

  def update
    @reservation = Booking.find(params[:id])
    if @reservation.update_attributes(booking_params)
      flash[:notice] = "Dane rezerwacji nr: #{@reservation.id} dla: #{@reservation.customer_name} #{@reservation.customer_surename} zostały zmienione"
      redirect_to(:action => "index")
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
    redirect_to(:action => "index")
  end

  private

  def booking_params
    params.require(:reservation).permit(:customer_name, :customer_surename, :phone_no, :customer_id, :table_id, :booking_data, :booking_hour_start, :booking_hour_end, :comment)
  end


end
