class WorksController < ApplicationController
  before_action :authenticate_house!

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
    @users = User.where(house_id: current_house.id)
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
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
    @users = User.where(house_id: current_house.id)
  end

  def update
    work = Work.find(params[:id])
    work.update(work_params)
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy
  end

  private
  
  def work_params
    params.require(:work).permit(:work_name, :user_name).merge(house_id: current_house.id)
  end

end
