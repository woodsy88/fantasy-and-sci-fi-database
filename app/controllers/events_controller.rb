class EventsController < ApplicationController
  before_action :set_event, only: [:destroy]

  def index
    @events = Event.all
  end


  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: ' Deleted' }
      format.json { head :no_content }
    end
  end 
  
  private

  def set_event
    @event = Event.find(params[:id])
  end
  

end