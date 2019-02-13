class Books::CommentsController < CommentsController
                                # this controller inherits the methods from the controllers/comments_controller.rb file
  before_action :set_commentable

  private

  def set_commentable
    # this instance variable is being passed to the controllers/comments_controller.rb create action
    @commentable = Book.find(params[:book_id])
  end

end