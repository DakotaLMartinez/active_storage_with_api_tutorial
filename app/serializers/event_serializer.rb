class EventSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :start_time, :end_time, :location, :poster_url
end
