class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :content_id
      t.integer :user_id

      t.timestamps
    end
  end
end
