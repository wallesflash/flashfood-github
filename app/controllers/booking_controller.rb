class BookingController < ApplicationController

  layout "main"
  before_action :check_login

  def index
    @bookings = Booking.sort_by_date
    @lp = 0

  end

  def show
    @reservation = Booking.find(params[:id])
  end

  def new
    @reserv_new = Booking.new
  end

  def create
    @reserv_new = Booking.new(booking_params)
    if @reserv_new.save
      flash[:notice] = "Rezerwacja nr: #{@reserv_new.id} została zapisana"
      redirect_to(:action => "index")
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
    params.require(:reservation).permit(:customer_name, :customer_surename, :table_id, :guests_quantity, :booking_data, :booking_time_start, :booking_time_end, :comment)
  end


end
