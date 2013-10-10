class AddDeletedAtToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :deleted_at, :timestamp
  end
end
