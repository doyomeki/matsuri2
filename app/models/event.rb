class Event < ActiveRecord::Base
  acts_as_paranoid

  has_many :contents
end
