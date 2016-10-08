class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :line1, null: false, limit: 90
      t.string :line2,              limit: 90
      t.string :city,  null: false, limit: 90
      t.string :state, null: false, limit: 2
      t.string :zip,   null: false, limit: 9
      
      t.belongs_to :location
      t.timestamps
    end
  end
end
