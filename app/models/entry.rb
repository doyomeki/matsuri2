class Entry < ActiveRecord::Base
  acts_as_paranoid
  before_create :delete_other_entries
  attr_accessor :other_entries

  belongs_to :content

  def delete_other_entries
    @other_entries = []
    Content.where(start_at: self.content.start_at).each do |content|
      other_entry = content.entries.where(user_id: self.user_id, content_id: content.id).first if content.id != self.content_id
      other_entry.destroy if other_entry
      @other_entries << other_entry if other_entry
    end
  end
end
