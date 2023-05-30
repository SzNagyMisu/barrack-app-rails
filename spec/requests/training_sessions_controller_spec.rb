require 'rails_helper'

RSpec.describe "TrainingSessionsControllers", type: :request do
  describe "GET /index" do
    pending "add some examples (or delete) #{__FILE__}"
  end

  describe 'POST /training_sessions/:id/register' do
    it 'registers the current user to the session passed in the request body.' do
      current_user = FactoryBot.create :user
      current_user.balance.update! amount: 2000
      sign_in current_user

      session = FactoryBot.create :training_session

      expect {
        post "/training_sessions/#{session.id}/register"
      }.to change{ current_user.reload.registered_training_session_ids }.from([]).to [current_user.id]
    end

    it 'raises validation error if current user does not have enough balance.' do
      current_user = FactoryBot.create :user
      current_user.balance.update! amount: 500
      sign_in current_user

      session = FactoryBot.create :training_session, price: 1000

      expect {
        post "/training_sessions/#{session.id}/register"
      }.to raise_exception ActiveRecord::RecordInvalid, /Amount must be greater than or equal to 0/
    end
  end
end
