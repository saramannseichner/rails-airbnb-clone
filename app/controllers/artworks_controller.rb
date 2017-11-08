class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :delete]

  def index
    @artworks = Artwork.all

    @artworks = Artwork.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@artworks) do |artwork, marker|
      marker.lat artwork.latitude
      marker.lng artwork.longitude
    end
  end

  def show
    @artworks = Artwork.find(params[:id])
    @artwork_coordinates = { lat: @flat.latitude, lng: @flat.longitude }
  end

  def new
    @artwork = Artwork.new
    @user = User.find(params[:id])
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save!
      redirect_to artwork_path(@artwork)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @artwork = Artwork.new(artwork_params)
     if @artwork.save!
      redirect_to artwork_path(@artwork)
    else
      render :edit
    end
  end

  def destroy
    @artwork.destroy
  end

  private

  def set_artwork
     @artwork = Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:name, :medium, :size, :description, :artist, :address, :photo)
  end

end
