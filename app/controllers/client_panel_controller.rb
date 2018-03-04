class ClientPanelController < ApplicationController
  before_action :authenticate_customer!, except: [:create_pdf]
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

  def create_pdf
      @bookings = Booking.find(params[:id])
      @table = Table.find_by_id(@bookings.table_id)
      @book_pdf = Booking.find(params[:id])
      respond_to do |format|
        format.html
        format.pdf do
          pdf = Prawn::Document.new
          pdf.text "Restauracja", aligh: :left, size: 12, style: :bold
          pdf.text "FlashFood", aligh: :left, size: 16, style: :bold
          pdf.move_down 60
          pdf.text "Potwierdzenie rezerwacji nr #{@book_pdf.id}", size: 20, style: :bold, align: :center

          pdf.draw_text "Data rezewacji: #{@book_pdf.booking_data} ", :at => [50, 570]
          pdf.draw_text "Imie i nazwisko: #{@book_pdf.customer_name + " " + @book_pdf.customer_surename} ", :at => [50, 540]
          pdf.draw_text "Rezerwacja w godzinach: #{@book_pdf.booking_hour_start.to_s(:only_hour) + " do " + @book_pdf.booking_hour_end.to_s(:only_hour)} ", :at => [50, 510]
          pdf.draw_text "Zarezerwowano #{@table.table_type} ", :at => [50, 480]
          pdf.move_down 150
          pdf.text "DZIEKUJEMY ZA WYBOR NASZEJ RESTAURACJI", align: :right

          send_data pdf.render, filename: "potwiedzenie rezerwacji nr #{@book_pdf.id}.pdf",
                                type: "application/pdf",
                                disposition: "inline"
        
      end
    end
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
