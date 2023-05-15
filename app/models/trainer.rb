class Trainer < ApplicationRecord
  validates :name, presence: true

  has_many :training_sessions, dependent: :destroy
end
