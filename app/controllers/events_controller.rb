class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new(user:current_user,start_date:Time.now+4000,location:"toto city")
  end

  def create
    event_params = params.require(:event).permit(:title,:description,:start_date,:duration,:price,:location)
    puts event_params[:location].inspect
    puts event_params[:"start_date(4i)"].inspect
    puts event_params.inspect
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
