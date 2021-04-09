class UsersController < ApplicationController
  before_action :authenticate_house!

  def index
  end

end