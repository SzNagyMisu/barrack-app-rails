class Profile < ApplicationRecord
  belongs_to :user

  GENDERS = %i[ male female ]
  enum :gender, GENDERS

  validates :name, presence: true, on: :update
  validates :height_in_cm, numericality: true, on: :update
  validates :weight_in_kg, numericality: true, on: :update
end
