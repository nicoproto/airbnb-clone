class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :description
      t.string :pokemon_type
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :sku

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
