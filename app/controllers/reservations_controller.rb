class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :delete]

  def index
    @reservations = reservation.find_by(user: current_user)
  end

  def show
  end

  def new
    @reservation = Reservation.new
    @user = current_user
    @artwork = Artwork.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save!
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @reservation = Reservation.new(reservation_params)
     if @reservation.save!
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
  end

  private

  def set_reservation
     @reservation = reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :artwork, :user)
  end
end
