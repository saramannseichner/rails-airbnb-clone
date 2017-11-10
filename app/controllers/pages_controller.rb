class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @artworks = Artwork.order("RANDOM()").limit(4)
    @recent_artwork = Artwork.order(created_at: :desc).limit(4)
  end
end
