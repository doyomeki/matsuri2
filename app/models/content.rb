class Content < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :event
  has_one :booth
end
