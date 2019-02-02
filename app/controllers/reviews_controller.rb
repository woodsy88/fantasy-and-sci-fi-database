class ReviewsController < ApplicationController
	  before_action :set_book, only: [:new, :create, :edit, :destroy, :update]
    before_action :set_review, only: [:edit, :update, :destroy]
    before_action :authenticate_user!, only: [ :new, :edit ]
	
	  def new
	    @review = Review.new
	  end
	
	  def create
	    @review = Review.new(review_params)
	    @review.book_id = @book.id
	    @review.user_id = current_user.id
	
	    if @review.save
	      redirect_to book_path(@book), notice: "your review has been posted"
	    else
	      render 'new'
	    end
	  end
	
    def edit
       authorize @review
	  end
	
    def update
       authorize @review
	    if @review.update(review_params)
	      redirect_to book_path(@book), notice: "your review was edited"
	    else
	      render 'edit'
	    end
	  end
	
	
    def destroy
      authorize @review
	    @review.destroy
	    respond_to do |format|
	      format.html { redirect_to books_url, notice: 'Review was successfully destroyed.' }
	    end    
	  end
	
	
	private
	
	  def review_params
	    params.require(:review).permit(:rating, :comment)
	  end
	
	  def set_book
	    @book = Book.find(params[:book_id])
	  end
	
	  def set_review
	    @review = Review.find(params[:id])
	  end
	end