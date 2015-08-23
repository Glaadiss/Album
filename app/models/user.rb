class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photoalbums
  has_many :likes
  has_many :comments
  mount_uploader :avatar, AvatarUploader

  has_many :friendships
  has_many :friends, through: :friendships

end
