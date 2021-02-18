class Event < ApplicationRecord
  has_many_attached :posters

  def poster_urls
    posters.map{|p| Rails.application.routes.url_helpers.url_for(p) }
  end
end
