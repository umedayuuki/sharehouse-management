class ChatsController < ApplicationController
  before_action :authenticate_house!

  def index
    @chats = Chat.all
  end

  def new
    @chat = Chat.new
    @users = User.where(house_id: current_house.id)
  end

  def create
    @users = User.all
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to chats_path
    else
      @users = User.where(house_id: current_house.id)
      render :new
    end
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def edit
    @chat = Chat.find(params[:id])
    @users = User.where(house_id: current_house.id)
  end

  def update
    chat = Chat.find(params[:id])
    chat.update(chat_params)
  end

  def destroy
    chat = Chat.find(params[:id])
    chat.destroy
  end

  private
  
  def chat_params
    params.require(:chat).permit(:talk, :image, :user_name).merge(house_id: current_house.id)
  end

end
