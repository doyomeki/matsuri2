class Entry < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :content
end
