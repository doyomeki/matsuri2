class AddDeletedAtToBooths < ActiveRecord::Migration
  def change
    add_column :booths, :deleted_at, :timestamp
  end
end
