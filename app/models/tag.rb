class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many   :sub_tags, class_name: 'Tag', foreign_key: 'tag_id'
  has_many   :campaign_tags, dependent: :destroy
end