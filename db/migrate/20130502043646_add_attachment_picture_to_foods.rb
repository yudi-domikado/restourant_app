class AddAttachmentPictureToFoods < ActiveRecord::Migration
  def self.up
    change_table :foods do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :foods, :picture
  end
end
