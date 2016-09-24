class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
      respond_to do |format|
      if @comment.save!
          flash.notice = "New comment have created!"
          format.html {redirect_to :back}
          format.js
          format.json {render action: "show",
                      status: :created, location: @comment}

      else
        flash.notice = "Unable to post comment!"
        format.html { redirect_to :back}
        format.json { render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end


  def edit
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash.notice = "Comment edited!"
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash.notice = "Comment deleted!"
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end



end
