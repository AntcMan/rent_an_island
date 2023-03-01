class BookingsController < ApplicationController
  def new
    # @island = Island.find(params[:island_id])
    # @new = Booking.new()
  end

  def index
    @user = current_user
    @bookings = Booking.where(user_id: @user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    booking = Booking.new(booking_params)
    booking.island = Island.find(params[:island_id])
    # booking.total_price = (params(:check_out_date) - params(:check_in_date)) * booking.island.price
    booking.user = current_user
    if booking.save
      # flash.now[:notice] = 'Booking done'
      redirect_to booking_path(booking)
    else
      # flash.now[:alert] = 'Booking not valid'
      # redirect_to island_path(Island.find(params[:island_id]))
      redirect_to new_user_session_path
    end
  end

  def edit
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to users_bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date)
  end
end
