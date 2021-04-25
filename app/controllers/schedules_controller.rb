class SchedulesController < ApplicationController
  before_action :authenticate_house!

  def index
    @schedule = Schedule.new
    @schedules = Schedule.all
    @users = User.where(house_id: current_house.id)
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
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @users = User.where(house_id: current_house.id)
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule)
    else
      @users = User.where(house_id: current_house.id)
      render :edit
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to schedules_path
  end

  private

  def schedule_params
    params.require(:schedule).permit(:start_time, :event, :user_name).merge(house_id: current_house.id)
  end
end
