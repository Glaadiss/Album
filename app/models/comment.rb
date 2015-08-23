class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photoalbum
  has_many :likes
  belongs_to :photo
end
