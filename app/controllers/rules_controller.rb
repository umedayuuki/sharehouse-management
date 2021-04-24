class RulesController < ApplicationController
  before_action :authenticate_house!

  def index
    @rules = Rule.all
  end

  def new
    @rule = Rule.new
    @users = User.where(house_id: current_house.id)
  end

  def create
    @users = User.all
    @rule = Rule.new(rule_params)
    if @rule.save
      redirect_to rules_path
    else
      @users = User.where(house_id: current_house.id)
      render :new
    end
  end

  def show
    @rule = Rule.find(params[:id])
  end

  def edit
    @rule = Rule.find(params[:id])
    @users = User.where(house_id: current_house.id)
  end

  def update
    @rule = Rule.find(params[:id])
    if @rule.update(rule_params)
      redirect_to rule_path(@rule)
    else
      @users = User.where(house_id: current_house.id)
      render :edit
    end
  end

  def destroy
    rule = Rule.find(params[:id])
    rule.destroy
    redirect_to rules_path
  end

  private
  
  def rule_params
    params.require(:rule).permit(:title, :content, :user_name).merge(house_id: current_house.id)
  end

end
