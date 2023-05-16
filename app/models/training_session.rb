class TrainingSession < ApplicationRecord
  belongs_to :trainer

  before_create :set_code

  validates :start_time, presence: true

  default_scope { order :start_time }

  scope :search, -> (q) {
    date_from = q[:date_from].present? ? q[:date_from] : nil
    date_to = q[:date_to].present? ? Date.parse(q[:date_to]) + 1.day : nil
    training_sessions = where start_time: date_from..date_to
    training_sessions = training_sessions.joins(:trainer).where '`trainers`.`name` LIKE ?', "%#{sanitize_sql_like(q[:trainer])}%" if q[:trainer].present?
    training_sessions
  }

  scope :default, -> { where start_time: Date.today.. }

  def trainer_name
    trainer.name
  end

  private

    def set_code
      send :code=, SecureRandom.alphanumeric(6).downcase
    end
end
