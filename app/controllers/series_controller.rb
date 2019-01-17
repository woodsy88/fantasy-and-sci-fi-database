class SeriesController < ApplicationController
   before_action :authenticate_user!
   before_action :set_series, only: [:show, :edit, :update, :destroy]


  private

    def set_book
      @book = Series.find(params[:series_id])
    end

    def book_params
      params.require(:series).permit(:title, :body)
    end   
end
