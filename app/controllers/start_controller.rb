class StartController < ApplicationController
  before_filter :authenticate_user!

  def index
    $current = current_user.id
  end

  def albums
    @albums = Photoalbum.all
    $current = current_user.id



  end

  def photos
    @albums = Photoalbum.all
    @album = @albums.find(params[:id])
    @photos = @album.photos
  end

  def addalbum
    @newa = Photoalbum.new
  end

  def madealbum
    @newa = Photoalbum.new(parametryalbum)

    @newa.user_id = current_user.id


    if @newa.save

      redirect_to(:action => 'index' )
    else
      render ('index')
    end


  end

  def parametryalbum

    params.require(:photoalbum).permit(:name, :info, :user_id, :private? )

  end





  def addphoto
    @newp = Photo.new
  end
  def madephoto
    @newp = Photo.new(parametryphoto)

    if @newp.save
      redirect_to(action:'index' )
    else
      render ('albums')

    end


  end

  def parametryphoto

    params.require(:photo).permit(:name, :info, :photoalbum_id, :avatar, :new_album)

  end

  def newlike

    @albums=Photoalbum.all
    @album = @albums.find(params[:id])
    @album.likes.where(user_id: current_user.id).delete_all
    @newlike = Like.new
    @newlike.like = true
    @newlike.user_id = current_user.id

    @newlike.photoalbum_id = @album.id

    if @newlike.save

      redirect_to(:action => 'albums' )
    else
      render ('albums')
    end
  end
  def newdislike

    @albums=Photoalbum.all
    @album = @albums.find(params[:id])
    @album.likes.where(user_id: current_user.id).delete_all
    @newlike = Like.new
    @newlike.dislike = true
    @newlike.user_id = current_user.id
    @newlike.photoalbum_id = @album.id

    if @newlike.save
      redirect_to(:action => 'albums' )
    else
      render ('albums')
    end
  end

  def unlike
    @albums=Photoalbum.all
    @album = @albums.find(params[:id])
    @album.likes.where(user_id: current_user.id).delete_all

    redirect_to(:action => 'albums' )
  end

  def parametrylike
    params.require(:like).permit(:like, :dislike, :photoalbum_id, :user_id, :comment_id, :photo_id, :un)
  end



end
