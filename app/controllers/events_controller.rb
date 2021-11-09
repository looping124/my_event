class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new(user:current_user)
  end

  def create
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
