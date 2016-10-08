class AddLocatableToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :locatable_id, :integer
    add_column :locations, :locatable_type, :string
    
    add_index :locations, [:locatable_type, :locatable_id]
  end
end
