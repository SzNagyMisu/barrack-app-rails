class Comment < ApplicationRecord
  belongs_to :commenter, foreign_key: :user_id
  belongs_to :commentable, polymorphic: true
end
