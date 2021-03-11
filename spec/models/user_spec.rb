require 'rails_helper'

describe User, type: :model do
  context 'Creating User' do
    context 'with invalid params' do
      before do
        @user = User.new(username: 'zohaib', email: 'zohaib@ciaflo.com', password: 'testing1', password_confirmation: 'testing1')
      end

      context 'username cases: ' do
        context 'when username is not given' do
          before do
            @user.username = ''
          end

          it "should raise username can't be blank error" do
            expect(@user.save).to eq false
            expect(@user.errors.present?).to eq true
            expect(@user.errors[:username][0]).to eq "can't be blank"
          end
        end

        context 'when username is too short' do
          before do
            @user.username = 'ab'
          end

          it "should raise username is too short error" do
            expect(@user.save).to eq false
            expect(@user.errors.present?).to eq true
            expect(@user.errors[:username][0]).to eq "is too short (minimum is 3 characters)"
          end
        end

        context 'when username is too long' do
          before do
            @user.username = 'abcdefghjklmnopqrstuvwxyz'
          end

          it "should raise username is too short error" do
            expect(@user.save).to eq false
            expect(@user.errors.present?).to eq true
            expect(@user.errors[:username][0]).to eq "is too long (maximum is 20 characters)"
          end
        end
      end

      context 'email cases: ' do
        context 'when email is not given' do
          before do
            @user.email = ''
          end

          it "should raise email can't be blank error" do
            expect(@user.save).to eq false
            expect(@user.errors.present?).to eq true
            expect(@user.errors[:email][0]).to eq "can't be blank"
          end
        end

        context 'when email is too short' do
          before do
            @user.email = 'a.com'
          end

          it "should raise email is too short error" do
            expect(@user.save).to eq false
            expect(@user.errors.present?).to eq true
            expect(@user.errors[:email][0]).to eq "is too short (minimum is 6 characters)"
          end
        end

        context 'when email is too long' do
          before do
            @user.email = 'abcdefghjklmnopqrstuvwxyzabcdefghjklmnopqrstuvwxyz.com'
          end

          it "should raise email is too short error" do
            expect(@user.save).to eq false
            expect(@user.errors.present?).to eq true
            expect(@user.errors[:email][0]).to eq "is too long (maximum is 30 characters)"
          end
        end
      end

      context 'password cases: ' do
        context 'when password is not given' do
          before do
            @user.password = ''
          end

          it "should raise password can't be blank error" do
            expect(@user.save).to eq false
            expect(@user.errors.present?).to eq true
            expect(@user.errors[:password][0]).to eq "can't be blank"
          end
        end

        context 'when password is too short' do
          before do
            @user.password = 'test'
          end

          it "should raise password is too short error" do
            expect(@user.save).to eq false
            expect(@user.errors.present?).to eq true
            expect(@user.errors[:password][0]).to eq "is too short (minimum is 6 characters)"
          end
        end

        context 'when password is too long' do
          before do
            @user.password = 'abcdefghjklmnopqrstuvwxyzabcdefghjklmnopqrstuvwxyz'
          end

          it "should raise password is too short error" do
            expect(@user.save).to eq false
            expect(@user.errors.present?).to eq true
            expect(@user.errors[:password][0]).to eq "is too long (maximum is 30 characters)"
          end
        end

        context 'when password confirmation does not match password' do
          before do
            @user.password_confirmation = 'abcdefghjklmnopqrstuvwxyzabcdefghjklmnopqrstuvwxyz'
          end

          it "should raise password_confirmation does not match error" do
            expect(@user.save).to eq false
            expect(@user.errors.present?).to eq true
            expect(@user.errors[:password_confirmation][0]).to eq "doesn't match Password"
          end
        end
      end
    end

    context 'with valid params' do
      before do
        @user = User.new(username: 'zohaib', email: 'zohaib@ciaflo.com', password: 'testing1', password_confirmation: 'testing1')
      end
      
      it "should save the user in the database" do
        expect(@user.save).to eq true
        expect(@user.errors.blank?).to eq true
      end
    end
  end
end

