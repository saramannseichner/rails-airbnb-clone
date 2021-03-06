class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_artwork, only: [:show, :edit, :delete]

  def index
    if params[:search]
      @artworks = Artwork.search(params[:search])
    else
      @artworks = Artwork.all.order('created_at DESC')
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    @artist = User.find(@artwork.user_id)
    @artworks = Artwork.where(['user_id = ?', @artist.id]).limit(4)
    @artwork_coordinates = { lat: @artwork.latitude, lng: @artwork.longitude }
    @reservation = Reservation.new
    @hash = Gmaps4rails.build_markers(@artwork) do |artwork, marker|
      marker.lat artwork.latitude
      marker.lng artwork.longitude
    end
  end

  def new
    @mediums = Artwork.mediums
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @user = current_user
    @artwork.user_id = @user.id
    if @artwork.save
      @user.new_artist unless @user.is_artist?
      redirect_to artwork_path(@artwork)
    else
      @mediums = Artwork.mediums
      @artwork = Artwork.new
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
