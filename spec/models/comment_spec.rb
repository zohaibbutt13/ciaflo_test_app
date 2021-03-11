require 'rails_helper'

describe Comment, type: :model do
  context 'Creating Comment' do
    before do
      @user     = User.create(username: 'zohaib', email: 'zohaib@ciaflo.com', password: 'testing1', password_confirmation: 'testing1')
      @campaign = Campaign.create(title: 'Test Camapign', purpose: 'Testing', estimated_duration: 'within 1 month', user_id: @user.id)
      @discussion_topic = DiscussionTopic.create(title: 'Testing Discussion', user_id: @user.id, campaign_id: @campaign.id)
      @comment  = Comment.new(body: 'Lorem Ipsum text', commentable_type: 'Campaign', commentable_id: @campaign.id, user_id: @user.id)
    end

    context 'with invalid params' do
      context 'body case: ' do
        before do
          @comment.body = ''
        end

        it "should raise body can't be blank error" do
          expect(@comment.save).to eq false
          expect(@comment.errors.present?).to eq true
          expect(@comment.errors[:body][0]).to eq "can't be blank"
        end
      end

      context 'when commentable_type is not present' do
        before do
          @comment.commentable_type = ''
        end

        it "should raise commentable_type can't be blank error" do
          expect(@comment.save).to eq false
          expect(@comment.errors.present?).to eq true
          expect(@comment.errors[:commentable][0]).to eq "must exist"
        end
      end

      context 'when commentable_id is not present' do
        before do
          @comment.commentable_id = ''
        end

        it "should raise commentable_id can't be blank error" do
          expect(@comment.save).to eq false
          expect(@comment.errors.present?).to eq true
          expect(@comment.errors[:commentable][0]).to eq "must exist"
        end
      end

      context 'when commentable_type is invalid' do
        before do
          @comment.commentable_type = 'User'
        end

        it "should raise commentable_type is invalid erorr" do
          expect(@comment.save).to eq false
          expect(@comment.errors.present?).to eq true
          expect(@comment.errors[:commentable][0]).to eq "must exist"
        end
      end

      context 'when commentable_id is invalid' do
        before do
          @comment.commentable_id = '-9'
        end

        it "should raise commentable_id is invalid error" do
          expect(@comment.save).to eq false
          expect(@comment.errors.present?).to eq true
          expect(@comment.errors[:commentable][0]).to eq "must exist"
        end
      end

      context 'when user_id is invalid' do
        before do
          @comment.user_id = ''
        end

        it "should raise user_id is invalid error" do
          expect(@comment.save).to eq false
          expect(@comment.errors.present?).to eq true
          expect(@comment.errors[:user][0]).to eq "must exist"
        end
      end
    end

    context 'with valid params' do
      context 'for campaign' do
        before do
          @comment.commentable_type = 'Campaign'
          @comment.commentable_id   = @campaign.id
        end

        it 'should save the comment in the database' do
          expect(@comment.save).to eq true
          expect(@comment.errors.blank?).to eq true
        end
      end

      context 'for discussion topic' do
        before do
          @comment.commentable_type = 'DiscussionTopic'
          @comment.commentable_id   = @discussion_topic.id
        end

        it 'should save the comment in the database' do
          expect(@comment.save).to eq true
          expect(@comment.errors.blank?).to eq true
        end
      end
    end
  end
end

