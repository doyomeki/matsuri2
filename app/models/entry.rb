class Entry < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :content

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

end
