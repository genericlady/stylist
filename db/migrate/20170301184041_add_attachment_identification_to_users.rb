class AddAttachmentIdentificationToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :identification
    end
  end

  def self.down
    remove_attachment :users, :identification
  end
end
