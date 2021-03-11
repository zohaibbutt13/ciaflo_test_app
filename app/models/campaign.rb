class Campaign < ActiveRecord::Base
  validates :title, presence: true
  validates :purpose, presence: true
  validates :estimated_duration, inclusion: { in: ['within 1 week', 'within 1 month', 'within 3 months'] }

  belongs_to :user
  has_many   :tags, through: :campaign_tags
  has_many   :comments, as: :commentable, dependent: :destroy
  has_many   :discussion_topics
end