class AddContentIamageToContents < ActiveRecord::Migration
  def change
    add_column :contents, :content_image_path, :text
  end
end
