class TrainingSession < ApplicationRecord
  belongs_to :trainer

  before_create :set_code

  validates :start_time, presence: true

  private

    def set_code
      send :code=, SecureRandom.alphanumeric(6).downcase
    end
end
