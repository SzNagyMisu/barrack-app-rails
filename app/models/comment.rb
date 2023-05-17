class Comment < ApplicationRecord
  belongs_to :commenter, foreign_key: :user_id, class_name: :User
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true

  def commenter_email
    commenter.email
  end
end
