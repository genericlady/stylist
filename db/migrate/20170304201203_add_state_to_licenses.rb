class AddStateToLicenses < ActiveRecord::Migration[5.0]
  def change
    add_column :licenses, :state, :string
  end
end
