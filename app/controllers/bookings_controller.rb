class BookingsController < ApplicationController
  def show
    @booking = current_user.bookings.find(params[:id])
  end

  def index
    @bookings = current_user.bookings
  end

  def create
    @pokemon = Pokemon.find(params[:pokemon_id])

    booking = Booking.new(booking_strong_params)
    booking.state = 'pending'
    booking.pokemon = @pokemon
    booking.pokemon_sku = @pokemon.sku
    booking.user = current_user
    booking.amount = (booking.end_date - booking.start_date) * @pokemon.price

    if booking.save
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @pokemon.name,
          images: ["https://assets.pokemon.com/assets/cms2/img/misc/countries/au/country_detail_pokemon.png"],
          amount: booking.amount_cents,
          currency: 'eur',
          quantity: 1
        }],
        success_url: booking_url(booking),
        cancel_url: booking_url(booking)
      )

      booking.update!(checkout_session_id: session.id)

      redirect_to new_booking_payment_path(booking)
    else
      @booking = Booking.new
      render 'pokemons/show'
    end
  end

  def destroy
    Booking.destroy(params[:id])
    redirect_to bookings_path
  end

  private

  def booking_strong_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
