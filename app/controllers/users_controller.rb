class UsersController < ApplicationController
  # def index
  # end

  def show
    #need to list all the posts
    #need to list notifications
    #need to list all the frinds or the link to all friends
    #need to list its own info and picture
    @user = User.find(params[:id])

  end




end
