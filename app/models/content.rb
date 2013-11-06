class Content < ActiveRecord::Base
  acts_as_paranoid
  has_attached_file :speaker_image,
    :storage => :dropbox,
    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
    :styles => { :medium => "300x300", :thumb => "100x100" },
    :dropbox_options => {
      :path => proc { |style| "#{style}/#{id}_#{speaker_image.original_filename}" }
  }

  default_scope { order(:start_at) }
  belongs_to :event
  belongs_to :booth
  has_many :entries
end
