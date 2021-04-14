class SchedulesController < ApplicationController
  before_action :authenticate_house!

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
    @users = User.where(house_id: current_house.id)
  end

  def create
    @users = User.all
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path
    else
      @users = User.where(house_id: current_house.id)
      render :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @users = User.where(house_id: current_house.id)
  end

  def update
    schedule = Schedule.find(params[:id])
    schedule.update(schedule_params)
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
  end

  private
  
  def schedule_params
    params.require(:schedule).permit(:day, :event, :user_name).merge(house_id: current_house.id)
  end
end
