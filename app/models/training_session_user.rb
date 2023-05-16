class TrainingSessionUser < ApplicationRecord
  belongs_to :user
  belongs_to :training_session

  STATES = %i[ registered joined ]
  enum :state, STATES
end
