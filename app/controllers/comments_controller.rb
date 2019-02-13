class CommentsController < ApplicationController
  before_action :authenticate_user!

  # there is a controllers/books/comments_controller.rb
  # there is a controllers/collections/comments_controller.rb
    # where @commentable is set

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user
    @comment.save
    redirect_to @commentable, notice: "Your comment was succesfully posted"
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end