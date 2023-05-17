class TrainingSession < ApplicationRecord
  belongs_to :trainer

  has_many :registered_training_session_users, -> { registered }, class_name: :TrainingSessionUser
  has_many :joined_training_session_users, -> { joined }, class_name: :TrainingSessionUser
  has_many :registered_users, class_name: :User, through: :registered_training_session_users, source: :user
  has_many :joined_users, class_name: :User, through: :joined_training_session_users, source: :user

  before_create :set_code

  validates :start_time, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validate :start_time_in_the_future, on: :create

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

  def join_user user
    send :joined_user_ids=, joined_user_ids.append(user.id).uniq
  end

  private

    def set_code
      send :code=, SecureRandom.alphanumeric(6).downcase
    end

    def start_time_in_the_future
      if start_time < Time.now
        errors.add :start_time, 'Cannot be in the past'
      end
    end
end
