class Event < ApplicationRecord
  has_many_attached :posters
  def poster_url
    Rails.application.routes.url_helpers.url_for(poster) if poster.attached?
  end

  def poster_urls
    posters.map{|p| Rails.application.routes.url_helpers.url_for(p) }
  end
end
