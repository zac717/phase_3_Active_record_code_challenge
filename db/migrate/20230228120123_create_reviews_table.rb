class CreateReviewsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :star_rating
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
