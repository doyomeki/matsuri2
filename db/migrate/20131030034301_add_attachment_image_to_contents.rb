class AddAttachmentImageToContents < ActiveRecord::Migration
  def self.up
    remove_column :contents, :speaker_image
    change_table :contents do |t|
      t.attachment :speaker_image
    end
  end

  def self.down
    add_column :contents, :speaker_image, :string
    drop_attached_file :contents, :speaker_image
  end
end
