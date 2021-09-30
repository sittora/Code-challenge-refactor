class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :star_rating
      t.belongs_to :user
      t.belongs_to :product
    end
  end
end
