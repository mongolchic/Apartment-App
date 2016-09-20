class AddAttachmentImageToApartments < ActiveRecord::Migration
  def self.up
    change_table :apartments do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :apartments, :image
  end
end
