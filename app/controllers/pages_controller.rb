class PagesController < ApplicationController
  before_action :authenticate_house!
end