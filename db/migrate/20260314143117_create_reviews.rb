class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :donation, null: false, foreign_key: true
      t.integer :points
      t.text :comment
      t.string :role

      t.timestamps
    end
  end
end
