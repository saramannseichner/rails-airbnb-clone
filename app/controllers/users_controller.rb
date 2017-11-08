class UsersController < ApplicationController
  def show
    @user = user.find(params[:id])
  end
end
