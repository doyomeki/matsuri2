class CreateBooths < ActiveRecord::Migration
  def change
    create_table :booths do |t|
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end
end
