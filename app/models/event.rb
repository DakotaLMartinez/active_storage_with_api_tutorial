class Event < ApplicationRecord
  has_one_attached :poster
  def poster_url
    Rails.application.routes.url_helpers.url_for(poster) if poster.attached?
  end
end
