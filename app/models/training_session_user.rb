class TrainingSessionUser < ApplicationRecord
  belongs_to :user
  belongs_to :training_session

  STATES = %i[ registered joined ]
  enum :state, STATES

  before_validation :subtract_price_from_user_balance!, on: :create

  private

    def subtract_price_from_user_balance!
      user.balance.subtract! training_session.price
    end
end
