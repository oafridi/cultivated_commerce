class EventsHost < ActiveRecord::Base
  belongs_to :host, class_name: "User"
  belongs_to :event
end
