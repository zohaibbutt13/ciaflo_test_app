class AddUserAndCaompaignReferenceToDiscussionTopics < ActiveRecord::Migration[5.1]
  def change
    add_reference :discussion_topics, :user,     index: true
    add_reference :discussion_topics, :campaign, index: true
  end
end
