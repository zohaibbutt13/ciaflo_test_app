require 'rails_helper'

describe Campaign, type: :model do
  context 'Creating Compaign' do
    before do
      @user     = User.create(username: 'zohaib', email: 'zohaib@ciaflo.com', password: 'testing1', password_confirmation: 'testing1')
      @campaign = Campaign.new(title: 'Test Camapign', purpose: 'Testing', estimated_duration: 'within 1 month')
    end

    context 'with invalid params' do
      context 'title cases: ' do
        context 'when title is not given' do
          before do
            @campaign.title = ''
          end

          it "should raise title can't be blank error" do
            expect(@campaign.save).to eq false
            expect(@campaign.errors.present?).to eq true
            expect(@campaign.errors[:title][0]).to eq "can't be blank"
          end
        end
      end

      context 'purpose cases: ' do
        context 'when purpose is not given' do
          before do
            @campaign.purpose = ''
          end

          it "should raise purpose can't be blank error" do
            expect(@campaign.save).to eq false
            expect(@campaign.errors.present?).to eq true
            expect(@campaign.errors[:purpose][0]).to eq "can't be blank"
          end
        end
      end

      context 'estimated_duration cases: ' do
        context 'when estimated_duration is not given' do
          before do
            @campaign.estimated_duration = ''
          end

          it "should raise estimated_duration is not included in the list error" do
            expect(@campaign.save).to eq false
            expect(@campaign.errors.present?).to eq true
            expect(@campaign.errors[:estimated_duration][0]).to eq "is not included in the list"
          end
        end

        context 'when given estimated_duration is invalid' do
          before do
            @campaign.estimated_duration = 'within a year'
          end

          it "should raise estimated_duration is not included in the list error" do
            expect(@campaign.save).to eq false
            expect(@campaign.errors.present?).to eq true
            expect(@campaign.errors[:estimated_duration][0]).to eq "is not included in the list"
          end
        end
      end

      context 'user_id not present: ' do
        it 'should raise user_id not present error' do
          expect(@campaign.save).to eq false
          expect(@campaign.errors.present?).to eq true
          expect(@campaign.errors[:user][0]).to eq "must exist"
        end
      end
    end

    context 'with valid params' do
      before do
        @campaign.user_id = @user.id
      end
      
      context 'with estimated_duration as within 1 week' do
        before do
          @campaign.estimated_duration = 'within 1 week'
        end

        it 'should save the campaign in the database' do
          expect(@campaign.save).to eq true
          expect(@campaign.errors.blank?).to eq true
        end
      end

      context 'with estimated_duration as within 1 month' do
        it 'should save the campaign in the database' do
          expect(@campaign.save).to eq true
          expect(@campaign.errors.blank?).to eq true
        end
      end

      context 'with estimated_duration as within 3 months' do
        before do
          @campaign.estimated_duration = 'within 3 months'
        end

        it 'should save the campaign in the database' do
          expect(@campaign.save).to eq true
          expect(@campaign.errors.blank?).to eq true
        end
      end
    end
  end
end

