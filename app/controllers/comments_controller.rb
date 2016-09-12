class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save!
      flash.notice = "New comment created!"
      redirect_to :back
    end
  end


  def edit
  end

  def update
    @comment = Comment.find(params[:comment_id])
    if @comment.update(comment_params)
      flash.notice = "Comment edited!"
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    flash.notice = "Comment deleted!"
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end



end
