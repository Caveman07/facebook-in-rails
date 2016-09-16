class UsersController < ApplicationController
  # def index
  # end

  def show
    #need to list all the posts
    #need to list notifications
    #need to list all the frinds or the link to all friends
    #need to list its own info and picture
    @post = current_user.posts.build
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @comment = @post.comments.new
    # @friendship = Friendship.find_by_user_id_and_friend_id(@user, User.find(params[:id]))
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        flash.notice = "User avatar updated!"
          format.html {redirect_to :back}
          format.js
          format.json { render json: @user }

      else
        flash.notice = "New post not created!"
        format.html { redirect_to :back}
        format.js
        format.json { render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end


    private

    def user_params
      params.require(:user).permit(:avatar)
    end

end
