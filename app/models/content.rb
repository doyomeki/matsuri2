class Content < ActiveRecord::Base
  acts_as_paranoid
  has_attached_file :speaker_image,
    :storage => :dropbox,
    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
    :styles => { :medium => "300x300", :thumb => "100x100" },
    :dropbox_options => {
    :path => proc { |style| "#{style}/#{id}_#{image.original_filename}" }
  }

  belongs_to :event
  has_one :booth
  has_many :entries
end
