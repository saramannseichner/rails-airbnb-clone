class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  if params[:search]
    @artworks = Artwork.search(params[:search]).order("created_at DESC")
  else
    @artworks = Artwork.all.order('created_at DESC')
  end
end
