require 'rails_helper'

describe DiscussionTopic, type: :model do
  context 'Creating Discussion Topic' do
    before do
      @user     = User.create(username: 'zohaib', email: 'zohaib@ciaflo.com', password: 'testing1', password_confirmation: 'testing1')
      @campaign = Campaign.create(title: 'Test Camapign', purpose: 'Testing', estimated_duration: 'within 1 month', user_id: @user.id)
      @discussion_topic = DiscussionTopic.new(title: 'Testing Discussion')
    end

    context 'when invalid params' do
      before do
        @discussion_topic.title = ''
      end

      it "should raise title can't be blank error" do
        expect(@discussion_topic.save).to eq false
        expect(@discussion_topic.errors.present?).to eq true
        expect(@discussion_topic.errors[:title][0]).to eq "can't be blank"
      end

      context 'when user_id not present' do
        before do
          @discussion_topic.campaign_id = @campaign.id
        end

        it 'should raise user_id not present error' do
          expect(@discussion_topic.save).to eq false
          expect(@discussion_topic.errors.present?).to eq true
          expect(@discussion_topic.errors[:user][0]).to eq "must exist"
        end
      end

      context 'when campaign_id not present' do
        before do
          @discussion_topic.user_id = @user.id
        end

        it 'should raise campaign_id not present error' do
          expect(@discussion_topic.save).to eq false
          expect(@discussion_topic.errors.present?).to eq true
          expect(@discussion_topic.errors[:campaign][0]).to eq "must exist"
        end
      end
    end

    context 'when valid params' do
      before do
        @discussion_topic.user_id     = @user.id
        @discussion_topic.campaign_id = @campaign.id
      end

      it 'should save the discussion topic object in the database' do
        expect(@discussion_topic.save).to eq true
        expect(@discussion_topic.errors.blank?).to eq true
      end
    end
  end
end

