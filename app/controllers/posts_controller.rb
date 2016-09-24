class PostsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :js


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save!
        flash.notice = "New post have created!"
        format.html {redirect_to :back}
        format.js
        format.json {render action: "show",
                    status: :created, location: @post}

      else
        flash.notice = "New post not created!"
        format.html { redirect_to :back}
        format.json { render json: @post.errors, status: :unprocessable_entity}
      end
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
