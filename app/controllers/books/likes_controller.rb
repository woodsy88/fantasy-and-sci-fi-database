class Books::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book

  def create                
  # If it exists in table, return it. If none exists, create one. no duplicate likes
    @book.likes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html { redirect_to @book }
      # format.js links to views/books/likes/create.js.erb
      format.js
    end
  end

  def destroy
    @book.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @book }
      # format.js links to views/books/likes/destroy.js.erb
      format.js
    end    
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end