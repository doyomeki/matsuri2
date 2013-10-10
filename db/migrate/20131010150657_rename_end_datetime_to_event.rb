class RenameEndDatetimeToEvent < ActiveRecord::Migration
  def change
    rename_column :events, :end_datetime, :finish_at
  end
end
