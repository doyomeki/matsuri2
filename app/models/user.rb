class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, authentication_keys: [:code]

  validates :code, uniqueness: true, presence: true, length: { maximum: 6 }, numericality: true
  validates :nickname, presence: true
  validates :password, confirmation: true, length: { within: 4..32 }

  belongs_to :user
  has_many :entries

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    clean_up_passwords
    update_attributes(params, *options)
  end
end
