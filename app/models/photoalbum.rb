class Photoalbum < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :likes
  has_many :comments
  mount_uploader :avatar, AvatarUploader
end
