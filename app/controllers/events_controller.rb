class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
    @events = Event.all.order('updated_at DESC')
  end

  def new
     @event = Event.new(user:current_user,start_date:Time.now+4000,location:"toto city")
  end

  def create
    event_params = params.require(:event).permit(:title,:description,:start_date,:duration,:price,:location)
    event_params[:user] = current_user
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      redirect_to root_path
    else
      render "new"
      puts "NOOOOOOOOOOOOOOOOOOOOOOO"
      puts @event.errors.messages
    end
  end

  def show
    @event = Event.find(params[:id])
    @end_date = @event.start_date + @event.duration*60
    

    if current_user == @event.user
      @admin = true
    else
      @admin = false
    end

    if @event.users.include? current_user
      @can_participate = false
    else
      @can_participate = true
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    event_params = params.require(:event).permit(:title,:description,:start_date,:duration,:price,:location)
    event_params[:user] = current_user
    if @event.update(event_params)
      redirect_to event_path(@event.id), success: "Event modifié avec succès"
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

end
