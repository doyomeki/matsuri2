class Booth < ActiveRecord::Base
  acts_as_paranoid

  has_one :content
end
