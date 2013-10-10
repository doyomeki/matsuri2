class RenameStartDatetimeToEvent < ActiveRecord::Migration
  def change
    rename_column :events, :start_datetime, :start_at
  end
end
