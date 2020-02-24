class PokemonsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_pokemon, only: %i[edit update delete show]

  def index
    @pokemons = Pokemon.all.geocoded

    @pokemons = @pokemons.near(Geocoder.search(params[:location]).first.coordinates, 1) if params[:location].present?
    @pokemons = Pokemon.search_by_name_type_owner(params[:query]).geocoded if params[:query].present?

    @markers = @pokemons.map do |pokemon|
      {
        lat: pokemon.latitude, lng: pokemon.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pokemon: pokemon }),
        image_url: "https://cdn4.iconfinder.com/data/icons/gaming-27/300/gaming-fun-entertainment-freetime-pokemon-512.png"
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    new_pokemon = Pokemon.new(pokemon_strong_params)
    new_pokemon.user = current_user
    new_pokemon.save ? (redirect_to root_path) : (render :new)
  end

  def edit; end

  def update
    @pokemon.update(pokemon_strong_params)
  end

  def destroy
    @pokemon.destroy
    redirect_to root
  end

  private

  def pokemon_strong_params
    params.require(:pokemon).permit(:name, :price, :address, :description, :pokemon_type, photos: [])
  end

  def find_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
