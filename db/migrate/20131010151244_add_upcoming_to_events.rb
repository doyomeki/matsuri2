class AddUpcomingToEvents < ActiveRecord::Migration
  def change
    add_column :events, :upcoming, :boolean, default: false
  end
end
