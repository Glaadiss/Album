class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :photoalbum
  belongs_to :photo
  belongs_to :comment
end
