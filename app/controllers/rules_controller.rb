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

  private
  def rule_params
    params.require(:rule).permit(:content)
  end
end
