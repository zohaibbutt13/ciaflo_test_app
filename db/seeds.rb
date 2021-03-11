# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: 'zohaib', email: 'zohaib@ciaflo.com', password: 'testing1', password_confirmation: 'testing1')
user2 = User.create(username: 'ruby', email: 'ruby@ciaflo.com', password: 'testing1', password_confirmation: 'testing1')
user3 = User.create(username: 'rails', email: 'rails@ciaflo.com', password: 'testing1', password_confirmation: 'testing1')

campaign1 = Campaign.create(title: 'Ruby Compaign', purpose: 'Assessment', estimated_duration: 'within 1 week', user_id: user1.id)
campaign2 = Campaign.create(title: 'Rails Compaign', purpose: 'Assessment', estimated_duration: 'within 1 month', user_id: user2.id)
campaign3 = Campaign.create(title: 'Ruby on Rails Compaign', purpose: 'Assessment', estimated_duration: 'within 3 months', user_id: user3.id)

discussion_topic1 = DiscussionTopic.create(title: 'Ruby Discussion', user_id: user1.id, campaign_id: campaign1.id)
discussion_topic2 = DiscussionTopic.create(title: 'Rails Discussion', user_id: user2.id, campaign_id: campaign2.id)
discussion_topic3 = DiscussionTopic.create(title: 'Ruby on Rails Discussion', user_id: user3.id, campaign_id: campaign3.id)

tag1 = Tag.create(name: 'Ruby Tag', tag_id: nil)
tag2 = Tag.create(name: 'Rails Tag', tag_id: tag1.id)
tag3 = Tag.create(name: 'Ruby on Rails Tag', tag_id: tag1.id)

Comment.create(body: 'Lorem Ipsum comment: Campaign', commentable_type: 'Campaign', commentable_id: campaign1.id)
Comment.create(body: 'Lorem Ipsum comment: Campaign', commentable_type: 'Campaign', commentable_id: campaign2.id)
Comment.create(body: 'Lorem Ipsum comment: Campaign', commentable_type: 'Campaign', commentable_id: campaign3.id)

Comment.create(body: 'Lorem Ipsum comment: Discussion Topic', commentable_type: 'DiscussionTopic', commentable_id: discussion_topic1.id)
Comment.create(body: 'Lorem Ipsum comment: Discussion Topic', commentable_type: 'DiscussionTopic', commentable_id: discussion_topic2.id)
Comment.create(body: 'Lorem Ipsum comment: Discussion Topic', commentable_type: 'DiscussionTopic', commentable_id: discussion_topic3.id)

CampaignTag.create(campaign_id: campaign1.id, tag_id: tag1.id)
CampaignTag.create(campaign_id: campaign2.id, tag_id: tag2.id)
CampaignTag.create(campaign_id: campaign3.id, tag_id: tag3.id)
