class BookingsController < ApplicationController
  def create
    @pokemon = Pokemon.find(params[:pokemon_id])

    booking = Booking.new(booking_strong_params)
    booking.status = "pending"
    booking.pokemon = @pokemon
    booking.user = current_user
    booking.total_price = (booking.end_date - booking.start_date) * @pokemon.price

    booking.save ? (redirect_to booking_path(booking)) : (render :new)
  end

  private

  def booking_strong_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
