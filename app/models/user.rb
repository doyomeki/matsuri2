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
end
