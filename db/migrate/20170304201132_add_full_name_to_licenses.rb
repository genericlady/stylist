class AddFullNameToLicenses < ActiveRecord::Migration[5.0]
  def change
    add_column :licenses, :full_name, :string
  end
end
