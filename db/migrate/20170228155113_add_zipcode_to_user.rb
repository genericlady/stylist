class AddZipcodeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :zipcode, :string, limit: 10
  end
end
