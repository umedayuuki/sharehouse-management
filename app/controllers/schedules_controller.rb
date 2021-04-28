class SchedulesController < ApplicationController
  before_action :authenticate_house!
  before_action :set_users, only: [:index, :edit]
  before_action :set_find_schedule, only: [:show, :edit, :update, :destroy]
  before_action :set_redirect, only: [:show, :edit]

  def index
    @schedule = Schedule.new
    @schedules = Schedule.all
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to action: :index
    else
      @schedules = Schedule.all
      @users = User.where(house_id: current_house.id)
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule)
    else
      @users = User.where(house_id: current_house.id)
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_time, :event, :user_name).merge(house_id: current_house.id)
  end

  def set_users
    @users = User.where(house_id: current_house.id)
  end

  def set_find_schedule
    @schedule = Schedule.find(params[:id])
  end

  def set_redirect
    redirect_to root_path if @schedule.house_id != current_house.id
  end

end
