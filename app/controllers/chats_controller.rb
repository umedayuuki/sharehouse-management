class ChatsController < ApplicationController
  before_action :authenticate_house!

  def index
    @chat = Chat.new
    @chats = Chat.all.order(id: 'DESC')
    @users = User.where(house_id: current_house.id)
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to action: :index
    else
      @chats = Chat.all.order(id: 'DESC')
      @users = User.where(house_id: current_house.id)
      render :index
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
    @chat = Chat.find(params[:id])
    if @chat.update(chat_params)
      redirect_to chat_path(@chat)
    else
      @users = User.where(house_id: current_house.id)
      render :edit
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    redirect_to chats_path
  end

  private

  def chat_params
    params.require(:chat).permit(:talk, :image, :user_name).merge(house_id: current_house.id)
  end
end
