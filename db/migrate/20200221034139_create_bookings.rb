class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date

      t.string :state
      t.string :pokemon_sku
      t.monetize :amount, currency: { present: false }
      t.string :checkout_session_id

      t.references :user, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
