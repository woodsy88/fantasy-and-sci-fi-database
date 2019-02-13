class DropSeries < ActiveRecord::Migration[5.2]
  def change
     remove_column :books, :series_id
     drop_table :series
     
  end
end
