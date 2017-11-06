class ArtworkController < ApplicationController

  before_action :set_artwork, only: [:show, :edit, :delete]
  def index
    @artworks = Artwork.all
  end

  def show
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
    params.require(:artwork).permit(:name, :medium, :size, :description, :artist, :address)
  end
end
