class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :delete]

  def index
    @user = current_user
    @reservations = Reservation.where(user: current_user)
    @status = Reservation.status
  end

  def show
    @artwork = Artwork.find(@reservation.artwork_id)
    @user = User.find(@reservation.user_id)
  end

  def new
    @reservation = Reservation.new
    @artwork = Artwork.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.artwork_id = params[:artwork_id]
    @reservation.status = "Pending"
    if @reservation.save!
      redirect_to user_reservation_path(@reservation.user.id, @reservation)
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
     @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :artwork, :user)
  end
end
