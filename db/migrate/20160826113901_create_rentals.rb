class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.date :date_from
      t.date :date_to
      t.integer :status
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
