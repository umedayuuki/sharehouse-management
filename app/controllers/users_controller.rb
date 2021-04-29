class UsersController < ApplicationController
  before_action :authenticate_house!
  before_action :set_find_user, only: [:show, :edit, :update, :destroy]
  before_action :set_redirect, only: [:show, :edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :image, :birthday).merge(house_id: current_house.id)
  end

  def set_find_user
    @user = User.find(params[:id])
  end

  def set_redirect
    redirect_to root_path if @user.house_id != current_house.id
  end
end
