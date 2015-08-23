class Photo < ActiveRecord::Base
  belongs_to :photoalbum
  has_many :likes
  has_many :comments

  mount_uploader :avatar, AvatarUploader


  attr_accessor :new_album

  before_create :albums


  def albums
    if new_album.length != 0
      nowy = Photoalbum.new
      nowy.name = new_album
      nowy.user_id = $current
      nowy.save
      self.photoalbum_id = nowy.id
    end
  end


end
