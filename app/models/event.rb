class Event < ActiveRecord::Base
  acts_as_paranoid

  has_many :contents

  def self.find_upcoming
    self.find_by_upcoming(true)
  end
end
