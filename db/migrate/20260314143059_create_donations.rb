class CreateDonations < ActiveRecord::Migration[8.1]
  def change
    create_table :donations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :category
      t.text :description
      t.string :condition
      t.string :availability
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
