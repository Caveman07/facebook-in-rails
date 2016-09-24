class LikesController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def create
    @post = Post.find(params[:post_id])

      if @post.like_post_by(current_user)
        redirect_to :back
      end

  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.dislike_post_by(current_user)
    redirect_to :back
  end

end
