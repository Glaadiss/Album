class FriendshipController < ApplicationController


  def users
  @users = User.where.not(email: current_user.email)
  end
  def create
    @users = User.where.not(email: current_user.email)
    friendid = @users.find(params[:id])
    friendship = Friendship.new
    friendship.user_id = current_user.id
    friendship.friend_id = friendid.id
    friendship.save
    redirect_to(:action => 'users' )
  end
  def destroy
    @users = User.where.not(email: current_user.email)
    friendidd = @users.find(params[:id])
    @friendship = Friendship.where(friend_id: friendidd.id)
    @friendship2 = Friendship.where(friend_id: current_user.id, user_id: friendidd.id)
    @friendship2.destroy_all
    @friendship.destroy_all
    redirect_to(:action => 'users' )
  end
  def friends
    qwe = current_user.id
    qwee = User.find(qwe)
    zaq = Friendship.where(user_id: qwe)
    @friends =zaq
    abc= Friendship.where(friend_id: current_user.id)
    @friends2 = abc
  end
end
