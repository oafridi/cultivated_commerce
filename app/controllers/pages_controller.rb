class Numeric
  def to_rad
    self * Math::PI / 180
  end
end

class PagesController < ApplicationController

  def home
    @items = Item.all
    if !params[:search]
      @events = Event.all.uniq
      @listings = Listing.all.uniq
      @hash = Gmaps4rails.build_markers(@events) do |event, marker|
        marker.lat event.latitude
        marker.lng event.longitude
        marker.infowindow render_to_string(:partial => "/events/show", :locals => { :object => event})
      end
    elsif !user_signed_in?
      @listings = Listing.search(params[:search]).uniq.order("created_at DESC")
      users = @listings.map { |l| l.user }
      @events = users.map { |u| u.events }.uniq.flatten

      @hash = Gmaps4rails.build_markers(@events) do |event, marker|
        marker.lat event.latitude
        marker.lng event.longitude
        marker.infowindow render_to_string(:partial => "/events/show", :locals => { :object => event})
      end
    else
      counter = 0
      @listings = Listing.search(params[:search]).order("created_at DESC")
      users = @listings.map { |l| l.user }
      events_unsorted = users.map { |u| u.events }.uniq.flatten
      @events = sort_events(events_unsorted)

      
      # @hash_user = current_user.to_gmaps4rails
      @hash = Gmaps4rails.build_markers(@events) do |event, marker|
        counter +=1        
        event.counter = counter
        if(event.hosts.first == current_user)
          color = "f7b100"
        elsif(event.participants.include?(current_user))
          color = "d34f4f"
        else
          color = "D0D0D0"
        end
        # CHANGE COLOUR HERE

        marker.lat event.latitude
        marker.lng event.longitude
        marker.infowindow render_to_string(:partial => "/events/show", :locals => { :object => event})
        marker.json({ :id => event.id })         
        marker.picture({
        :url     => "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=#{counter}|#{color}|000000",
        :width   => 32,
        :height  => 32
        })
        # HOUSE HERE

      end
      @hash.push(
        {:lat=> current_user.latitude,
          :lng=> current_user.longitude,
          :infowindow=>
           "<p> Address: #{current_user.full_street_address} </p>\n<br>\n",
          :picture=>{:url=>"https://chart.googleapis.com/chart?chst=d_map_xpin_icon&chld=pin_star%7Chome%7C00FFFF%7CFF0000", :width=>32, :height=>32}}
        )
    end
  end

  def sort_events(events_unsorted)
    distances = []
    events_unsorted.each do |event|
      event.distance = distance(current_user.coords, event.coords).round(2)
    end
    events_unsorted.sort_by {|obj| obj.distance}.uniq
  end

  def distance loc1, loc2
    lat1, lon1 = loc1
    lat2, lon2 = loc2
    dLat = (lat2-lat1).to_rad;
    dLon = (lon2-lon1).to_rad;
    a = Math.sin(dLat/2) * Math.sin(dLat/2) +
        Math.cos(lat1.to_rad) * Math.cos(lat2.to_rad) *
        Math.sin(dLon/2) * Math.sin(dLon/2);
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    d = 6371 * c;
  end
end
