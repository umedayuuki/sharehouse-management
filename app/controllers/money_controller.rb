class MoneyController < ApplicationController
  before_action :authenticate_house!

  def index
    @money = Money.all.order(id: 'DESC')
    @users = User.where(house_id: current_house.id)
  end

  def new
    @money = Money.new
    @users = User.where(house_id: current_house.id)
  end

  def create
    @users = User.all
    @money = Money.new(money_params)
    if @money.save
      redirect_to money_index_path
    else
      @users = User.where(house_id: current_house.id)
      render :new
    end
  end

  def show
    @money = Money.find(params[:id])
  end

  def edit
    @money = Money.find(params[:id])
    @users = User.where(house_id: current_house.id)
  end

  def update
    @money = Money.find(params[:id])
    if @money.update(money_params)
      redirect_to money_path(@money)
    else
      @users = User.where(house_id: current_house.id)
      render :edit
    end
  end

  def destroy
    money = Money.find(params[:id])
    money.destroy
    redirect_to money_index_path
  end

  private

  def money_params
    params.require(:money).permit(:item_name, :price, :user_name).merge(house_id: current_house.id)
  end
end
