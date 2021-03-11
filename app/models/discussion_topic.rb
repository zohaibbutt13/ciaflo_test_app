class DiscussionTopic < ActiveRecord::Base
  validates :title, presence: true
  validates :user_id, uniqueness: { scope: :campaign_id, message: "Users can only create one discussion topic per campaign." }

  belongs_to :user
  belongs_to :campaign
  has_many   :comments, as: :commentable, dependent: :destroy
end