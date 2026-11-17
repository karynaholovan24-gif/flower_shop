class AddUserToFlowers < ActiveRecord::Migration[8.1]
  def change
    add_reference :flowers, :user, null: true, foreign_key: true
  end
end