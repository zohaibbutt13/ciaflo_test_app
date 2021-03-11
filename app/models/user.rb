class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :email,    presence: true, uniqueness: true, length: { in: 6..30 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  has_many :discussion_topic
  has_many :campaigns, dependent: :destroy
  has_many :comments
end