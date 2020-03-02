class AddPriceToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_monetize :pokemons, :price, currency: { present: false }
  end
end
