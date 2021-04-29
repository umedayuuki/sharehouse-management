class MoneyController < ApplicationController
  before_action :authenticate_house!
  before_action :set_users, only: [:index, :new, :edit]
  before_action :set_find_money, only: [:show, :edit, :update, :destroy]
  before_action :set_redirect, only: [:show, :edit]

  def index
    @money = Money.all.order(id: 'DESC')
  end

  def new
    @money = Money.new
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
  end

  def edit
  end

  def update
    if @money.update(money_params)
      redirect_to money_path(@money)
    else
      @users = User.where(house_id: current_house.id)
      render :edit
    end
  end

  def destroy
    @money.destroy
    redirect_to money_index_path
  end

  private

  def money_params
    params.require(:money).permit(:item_name, :price, :user_name).merge(house_id: current_house.id)
  end

  def set_users
    @users = User.where(house_id: current_house.id)
  end

  def set_find_money
    @money = Money.find(params[:id])
  end

  def set_redirect
    redirect_to root_path if @money.house_id != current_house.id
  end
end
