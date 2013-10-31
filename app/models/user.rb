class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, authentication_keys: [:code]

  validates :code, uniqueness: true, presence: true
  validates :nickname, :password, presence: true

  belongs_to :user
  has_many :entries
end
