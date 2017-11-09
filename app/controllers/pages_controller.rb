class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @artworks = Artwork.all
    @recent_artwork = Artwork.order(created_at: :desc).limit(3)
  end
end
