class Collections::CommentsController < CommentsController
                                # this controller inherits the methods from the controllers/comments_controller.rb file
  before_action :set_commentable

  private

  def set_commentable
    # this instance variable is being passed to the controllers/commments_controller.rb create action
    @commentable = Collection.find(params[:collection_id])
  end

end