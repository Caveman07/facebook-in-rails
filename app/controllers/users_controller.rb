class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all

  end

  def show

    @post = current_user.posts.build
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @comment = @post.comments.new
    @feed_items = @user.collect_feed

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
