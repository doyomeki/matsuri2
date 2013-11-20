class AddDeletedAtToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :deleted_at, :timestamp
  end
end
