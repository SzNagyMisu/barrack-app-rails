class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_one :balance

  has_many :received_comments, as: :commentable, class_name: :Comment
  has_many :written_comments, class_name: :Comment

  has_many :registered_training_session_users, -> { registered }, class_name: :TrainingSessionUser
  has_many :joined_training_session_users, -> { joined }, class_name: :TrainingSessionUser
  has_many :registered_training_sessions, class_name: :TrainingSession, through: :registered_training_session_users, source: :training_session
  has_many :joined_training_sessions, class_name: :TrainingSession, through: :joined_training_session_users, source: :training_session

  after_create do
    create_balance!
    create_profile!
  end
end
