class CreateLicenses < ActiveRecord::Migration[5.0]
  def change
    create_table :licenses do |t|
      t.column :expiration, :string
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
