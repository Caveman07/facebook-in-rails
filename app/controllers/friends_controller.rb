class FriendsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @friends = @user.friends.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to @user  #or user_path(params[:id])
  end

end
