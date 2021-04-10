class RulesController < ApplicationController
  before_action :authenticate_house!

  def index
    @rules = Rule.all
  end

  def new
    @rule = Rule.new
  end

  def create
    Rule.create(rule_params)
  end

  def show
    @rule = Rule.find(params[:id])
  end

  def edit
    @rule = Rule.find(params[:id])
  end

  def update
    rule = Rule.find(params[:id])
    rule.update(rule_params)
  end
  
  def destroy
    rule = Rule.find(params[:id])
    rule.destroy
  end

  private
  
  def rule_params
    params.require(:rule).permit(:content).merge(house_id: current_house.id)
  end
end
