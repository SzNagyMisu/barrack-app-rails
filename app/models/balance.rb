class Balance < ApplicationRecord
  belongs_to :user

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def add! plus_amount
    update! amount: amount + plus_amount
  end
end
