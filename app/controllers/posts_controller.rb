class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      flash.notice = "New post have created!"
      redirect_to :back
    else
      flash.notice = "New post not created!"
      redirect_to :back
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    flash.notice = "Post Updated!"
    redirect_to :back
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash.notice = "Post Updated!"
    redirect_to :back
  end


  private
    def post_params
      params.require(:post).permit(:user_id, :body)
    end
end
