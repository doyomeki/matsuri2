class Entry < ActiveRecord::Base
  acts_as_paranoid
  before_create :delete_another_entry

  belongs_to :content

=begin
  def status(content, user)
    Entry.where(content_id: content.id, user_id: user.id).present?
  end

  def self.status(content, user)
    Entry.where(content_id: content.id, user_id: user.id).present? 
  end

  def self.another_status(content)
    for another_content in Content.where(start_at: content.start_at) do
      if another_content != content then
        return another_content
      end
    end
  end
=end

  def delete_another_entry
    Content.where(start_at: self.content.start_at).each do |content|
      content.entries.where(content_id: content.id).first.destroy unless content.id == self.content_id
    end
  end
end
