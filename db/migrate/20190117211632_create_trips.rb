class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :country, foreign_key: true
      t.references :user, foreign_key: true

      t.string :picture
      t.integer :rating
      t.string :description
      t.string :price
      t.string :name

      t.timestamps
    end
  end
end
