class WorksController < ApplicationController
  before_action :authenticate_house!
  before_action :set_users, only: [:index, :new, :edit]
  before_action :set_find_work, only: [:show, :edit, :update, :destroy]
  before_action :set_redirect, only: [:show, :edit]

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @users = User.all
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path
    else
      @users = User.where(house_id: current_house.id)
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @work.update(work_params)
      redirect_to work_path(@work)
    else
      @users = User.where(house_id: current_house.id)
      render :edit
    end
  end

  def destroy
    @work.destroy
    redirect_to works_path
  end

  private

  def work_params
    params.require(:work).permit(:work_name, :user_name).merge(house_id: current_house.id)
  end

  def set_users
    @users = User.where(house_id: current_house.id)
  end

  def set_find_work
    @work = Work.find(params[:id])
  end

  def set_redirect
    redirect_to root_path if @work.house_id != current_house.id
  end
end
