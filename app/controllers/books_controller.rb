class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_book, only: [:show, :edit, :update, :destroy, :bookmark]
  before_action :authenticate_user!, only: [ :new, :edit ]


  def index
    if params[:category].blank?
      @books = Book.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @books = Book.where(:category_id => @category_id)
    end   
  end
  
  def new
    @book = Book.new
    @categories = Category.all.map{ |category| [ category.name, category.id ] }
  end

  def edit
    authorize @book

    @categories = Category.all.map{ |category| [ category.name, category.id ] }
  end

  def create
		@book = Book.new(book_params)
    @book.user_id = current_user.id
    
    @book.category_id = params[:category_id]

		if @book.save
			redirect_to @book, notice: 'Your book was created successfully'
		else
			render :new
		end
  end

  def update
    authorize @book

    @book.category_id = params[:category_id]

    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @book
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    if @book.reviews.blank?
      @average_review = 0
    else
      @average_review = @book.reviews.average(:rating).round(2)
    end
  end

  def bookmark
    current_user.events.create(action: "bookmarked", eventable: @book)
    redirect_to books_path, notice: "you booked marked #{@book.title}"
  end
    
  private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :description, :category_id)
    end
end
