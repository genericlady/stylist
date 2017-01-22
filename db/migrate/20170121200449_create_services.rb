class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 15, scale: 2
    end
  end
end
