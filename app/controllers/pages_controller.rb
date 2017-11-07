class PagesController < ApplicationController
  def home
    @artworks = Artwork.all
  end
end
