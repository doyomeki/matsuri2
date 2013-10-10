class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :capacity
      t.string :place
      t.timestamp :start_datetime
      t.timestamp :end_datetime
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
