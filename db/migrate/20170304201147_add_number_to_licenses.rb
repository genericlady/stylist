class AddNumberToLicenses < ActiveRecord::Migration[5.0]
  def change
    add_column :licenses, :number, :string
  end
end
