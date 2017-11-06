class ArtworkController < ApplicationController
  def index
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find(params[:id])
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
    @artwork = Artwork.find(params[:id])
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
  end

  private

  def artwork_params
    params.require(:artwork).permit(:name, :medium, :size, :description, :artist, :address)
  end
end
