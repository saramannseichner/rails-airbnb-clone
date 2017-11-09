class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @artworks = Artwork.all.limit(4)
    @artwork_option = Artwork.medium_option
    @recent_artwork = Artwork.order(created_at: :desc).limit(4)
  end
end
