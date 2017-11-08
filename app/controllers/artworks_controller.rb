class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_artwork, only: [:show, :edit, :delete]

  def index
    @artworks = Artwork.all

    if params[:search]
      @artworks = Artwork.search(params[:search]).order("created_at DESC")
    else
      @artworks = Artwork.all.order('created_at DESC')
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    @user = User.find(@artwork.user_id)
    @artwork_coordinates = { lat: @artwork.latitude, lng: @artwork.longitude }
    @reservation = Reservation.new
    @hash = Gmaps4rails.build_markers(@artwork) do |artwork, marker|
      marker.lat artwork.latitude
      marker.lng artwork.longitude
    end
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user_id = current_user.id
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
    params.require(:artwork).permit(:name, :price, :height, :medium, :width, :description, :artist, :address, :photo)
  end

end
