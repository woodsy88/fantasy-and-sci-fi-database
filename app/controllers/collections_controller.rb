class CollectionsController < ApplicationController
   before_action :authenticate_user!
   before_action :set_collection, only: [:show, :edit, :update, :destroy]

def index
    @collections = Collection.all
  end

  def new
    @collection = Collection.new
  end

  def create
     @collection = Collection.new(collection_params)

    if @collection.save
      redirect_to @collection, notice: "your collection has been created"
    else
      render 'new'
    end     
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'collection was successfully destroyed.' }
      format.json { head :no_content }
    end    
  end   


  private

    def set_collection
      @collection = Collection.find(params[:id])
    end

    def collection_params
      params.require(:collection).permit(:title, :description)
    end   
end
