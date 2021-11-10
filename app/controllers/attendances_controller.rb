class AttendancesController < ApplicationController

  before_action :is_admin? , only: [:new,:create]
  before_action :can_participate? , only: [:new,:create]

  def index
    @attendances = Event.find(params[:event_id]).attendances
    @event = Event.find(params[:event_id])
  end

  def new
    @user = current_user
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new
  end

  def create
    # Before the rescue, at the beginning of the method
    @user = current_user
    @stripe_amount = 500
    @event = Event.find(params[:event_id])
    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @stripe_amount,
      description: "Achat d'un produit",
      currency: 'eur',
      })
      Attendance.create(user:@user,event:@event,stripe_customer_id:customer.id)
    rescue Stripe::CardError => e
      flash[:error] = e.message
      render 'new'
    end
    # After the rescue, if the payment succeeded
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def is_admin?
    puts "%"*80
    puts params[:event_id]
      if current_user == Event.find(params[:event_id]).user 
        flash[:danger] = "You can\'t participate "
        redirect_to event_path(params[:event_id])
      end
    end

    def can_participate?
      puts "%"*80
      puts params[:event_id]
        if Event.find(params[:event_id]).users.include? current_user
          flash[:danger] = "You can\'t participate "
          redirect_to event_path(params[:event_id])
        end
      end

end
