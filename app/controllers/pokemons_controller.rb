class PokemonsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_pokemon, only: %i[edit update delete show]

  def index
    @pokemons = set_pokemons
    @markers = create_markers(@pokemons)
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

  def filter
    case params[:filteraction]
    when 'price_asc' then @pokemons = set_pokemons.sort_by(&:price)
    when 'price_desc' then @pokemons = set_pokemons.sort_by { |pokemon| - pokemon.price }
    # when 'review_desc' then @pokemons = set_pokemons.order(avg_reviews: :desc)
    # when 'review_asc' then @pokemons = set_pokemons.order(avg_reviews: :asc)
    end

    respond_to do |format|
      format.js { render :filter }
    end
  end

  def funpage

  end

  private

  def pokemon_strong_params
    params.require(:pokemon).permit(:name, :price, :address, :description, :pokemon_type, photos: [])
  end

  def find_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def create_markers(pokemons)
    @markers = pokemons.map do |pokemon|
      {
        lat: pokemon.latitude, lng: pokemon.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { pokemon: pokemon }),
        image_url: "https://cdn4.iconfinder.com/data/icons/gaming-27/300/gaming-fun-entertainment-freetime-pokemon-512.png"
      }
    end
  end

  def set_pokemons
    @pokemons = Pokemon.geocoded

    if (params[:queryCurrentLocation].present? && params[:queryCurrentLocation] != "")
      coordinates = params[:queryCurrentLocation].split(",").map(&:to_f)
      @pokemons = @pokemons.near(coordinates, 5)
    elsif (params[:location].present? && params[:location] != "")
      @pokemons = @pokemons.near(Geocoder.search(params[:location]).first.coordinates, 5)
    end

    if (params[:query].present? && params[:query] != "")
      @pokemons = @pokemons.search_by_name_type_owner(params[:query])
    end

    return @pokemons
  end
end
