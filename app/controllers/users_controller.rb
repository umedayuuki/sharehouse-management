class UsersController < ApplicationController
  before_action :authenticate_house!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end
  
  private

  def user_params
    params.require(:user).permit(:user_name, :image, :birthday).merge(house_id: current_house.id)
  end

end