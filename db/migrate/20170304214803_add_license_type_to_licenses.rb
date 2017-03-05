class AddLicenseTypeToLicenses < ActiveRecord::Migration[5.0]
  def change
    add_column :licenses, :license_type, :string
  end
end
