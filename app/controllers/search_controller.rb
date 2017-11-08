class SearchController < ApplicationController
  if params[:search]
    @artworks = Artwork.search(params[:search]).order("created_at DESC")
  else
    @artworks = Artwork.all.order('created_at DESC')
  end
end
