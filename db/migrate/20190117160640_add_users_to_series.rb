class AddUsersToSeries < ActiveRecord::Migration[5.2]
  def change
    add_reference :series, :user, foreign_key: true
  end
end
