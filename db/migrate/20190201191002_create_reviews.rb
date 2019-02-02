class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
    end
  end
end
