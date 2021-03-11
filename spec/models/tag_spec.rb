require 'rails_helper'

describe Tag, type: :model do
  context 'Creating Tag' do
    before do
      @tag = Tag.new(name: 'testing tag')
    end

    context 'with invalid params' do
      context 'name case: ' do
        before do
          @tag.name = ''
        end

        it "should raise name can't be blank error" do
          expect(@tag.save).to eq false
          expect(@tag.errors.present?).to eq true
          expect(@tag.errors[:name][0]).to eq "can't be blank"
        end
      end
    end

    context 'with valid params' do
      it "should save the tag object in the database" do
        expect(@tag.save).to eq true
        expect(@tag.errors.blank?).to eq true
      end
    end
  end
end