class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.hosts << current_user
    if @event.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find_by(id: params[:id])
    render 'events/edit'
  end

  def update
    @event = Event.find_by(id: params[:id])

    if @event.update(event_params)
      redirect_to current_user
    else
      render 'events/edit'
    end
  end

  def cancel
    @event = Event.find_by(id: params[:id])
    @event.destroy
    redirect_to current_user
  end

  def attend
    @event = Event.find_by(id: params[:id])
    EventsParticipant.create(event_id: (params[:id]), participant_id:(current_user.id))
    redirect_to current_user
  end

  def unattend
    @event = Event.find_by(id: params[:id])
    @event.participants.delete(current_user)
    redirect_to current_user
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, 
      :image, :address_line_1, :city, :state, :zipcode, 
      :time, :date)
  end

end
