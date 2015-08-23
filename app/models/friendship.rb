class Friendship < ActiveRecord::Base
  belongs_to :user, foreign_key: :user_id
  belongs_to :friend, class: "User", foreign_key: :friend_id
end
