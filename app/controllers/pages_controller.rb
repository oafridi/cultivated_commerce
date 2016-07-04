class PagesController < ApplicationController

  #Todo Refactor by extracting some of this code
  def home
    @items = Item.all
    if !params[:search]
      @events = Event.all.uniq
      @listings = Listing.all.uniq
      @markers = build_hash
    elsif !user_signed_in?
      @listings = Listing.search(params[:search])
      users = @listings.map { |listing| listing.user }
      @events = users.map { |user| user.events }.uniq.flatten

      @markers = build_hash
    else
      counter = 0
      @listings = Listing.search(params[:search])
      users = @listings.map { |l| l.user }
      events_unsorted = users.map { |u| u.events }.uniq.flatten
      @events = sort_events(events_unsorted)

      @markers = Gmaps4rails.build_markers(@events) do |event, marker|
        counter +=1
        event.counter = counter
        color = get_color(event)
        marker.lat event.latitude
        marker.lng event.longitude
        marker.infowindow render_to_string(:partial => '/events/show', :locals => {:object => event})
        marker.json({:id => event.id})
        marker.picture({
                           :url => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=#{counter}|#{color}|000000",
                           :width => 32,
                           :height => 32
                       })
      end
      update_markers
    end
  end

  def update_markers
    @markers.push(
        {:lat => current_user.latitude,
         :lng => current_user.longitude,
         :infowindow =>
             "<p> Address: #{current_user.address} </p>\n<br>\n",
         :picture => {
             url: 'https://chart.googleapis.com/chart?chst=d_map_xpin_icon&chld=pin_star%7Chome%7C00FFFF%7CFF0000',
             width: 32,
             height: 32}
        }
    )
  end

  def get_color(event)
    if event.hosts.first == current_user
      color = 'f7b100'
    elsif event.participants.include?(current_user)
      color = 'd34f4f'
    else
      color = 'D0D0D0'
    end
    color
  end

  private

  def build_hash
    Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow render_to_string(:partial => '/events/show', :locals => {:object => event})
    end
  end

  def sort_events(events_unsorted)
    events_unsorted.each do |event|
      event.distance = current_user.distance_to(event.coordinates)
    end
    events_unsorted.sort_by { |obj| obj.distance }.uniq
  end
end
