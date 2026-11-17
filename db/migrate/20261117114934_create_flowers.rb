class CreateFlowers < ActiveRecord::Migration[8.1]
  def change
    create_table :flowers do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :category

      t.timestamps
    end
  end
end
