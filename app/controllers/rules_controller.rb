class RulesController < ApplicationController
  before_action :authenticate_house!
  before_action :set_users, only: [:new, :edit]
  before_action :set_find_rule, only: [:show, :edit, :update, :destroy]
  before_action :set_redirect, only: [:show, :edit]

  def index
    @rules = Rule.all
  end

  def new
    @rule = Rule.new
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
  end

  def edit
  end

  def update
    if @rule.update(rule_params)
      redirect_to rule_path(@rule)
    else
      @users = User.where(house_id: current_house.id)
      render :edit
    end
  end

  def destroy
    @rule.destroy
    redirect_to rules_path
  end

  private

  def rule_params
    params.require(:rule).permit(:title, :content, :user_name).merge(house_id: current_house.id)
  end

  def set_users
    @users = User.where(house_id: current_house.id)
  end

  def set_find_rule
    @rule = Rule.find(params[:id])
  end

  def set_redirect
    redirect_to root_path if @rule.house_id != current_house.id
  end

end
