class AddSeriesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :series, foreign_key: true
  end
end
