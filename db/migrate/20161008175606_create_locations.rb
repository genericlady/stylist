class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.belongs_to :user, index: true
      t.string :address1, null: false, limit: 90
      t.string :address2,              limit: 90
      t.string :city,  null: false, limit: 90
      t.string :state, null: false, limit: 15
      t.string :zip,   null: false, limit: 9
      
      t.timestamps
    end
  end
end
