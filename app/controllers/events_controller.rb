class EventsController < ApplicationController
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    
    @event.save
    redirect_to @event
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def index
    @events = Event.all
  end
  
  def update
    @event = Event.find(params[:id])
    
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  private
    def event_params
      params.require(:event).permit(:name, :description)
    end
end
