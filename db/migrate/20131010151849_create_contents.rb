class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :event_id
      t.integer :booth_id
      t.string :title
      t.string :description
      t.timestamp :start_at
      t.timestamp :finish_at
      t.string :speaker_name
      t.string :speaker_profile
      t.string :speaker_image
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
