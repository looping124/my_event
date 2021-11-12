class Admin::EventsController < ApplicationController
  before_action :is_admin?
  def index
    @events = Event.all.order('id')
  end

  def validation
    event = Event.find(params[:event_id])
    puts "TOTO"*30
    puts event
    if !event.nil?
      event.isvalidated = true
      puts event.errors.inspect
      event.save
    end
    # event.update(isvalidated: true)
    # puts event.errors.messages
    # event.save
    redirect_to admin_events_path
    # admin_event_validation
  end

end
