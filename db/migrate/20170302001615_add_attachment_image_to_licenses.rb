class AddAttachmentImageToLicenses < ActiveRecord::Migration
  def self.up
    change_table :licenses do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :licenses, :image
  end
end
