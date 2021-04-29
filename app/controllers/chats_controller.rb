class ChatsController < ApplicationController
  before_action :authenticate_house!
  before_action :set_users, only: [:index, :edit]
  before_action :set_find_chat, only: [:show, :edit, :update, :destroy]
  before_action :set_redirect, only: [:show, :edit]

  def index
    @chat = Chat.new
    @chats = Chat.all.order(id: 'DESC')
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
  end

  def edit
  end

  def update
    if @chat.update(chat_params)
      redirect_to chat_path(@chat)
    else
      @users = User.where(house_id: current_house.id)
      render :edit
    end
  end

  def destroy
    @chat.destroy
    redirect_to chats_path
  end

  private

  def chat_params
    params.require(:chat).permit(:talk, :image, :user_name).merge(house_id: current_house.id)
  end

  def set_users
    @users = User.where(house_id: current_house.id)
  end

  def set_find_chat
    @chat = Chat.find(params[:id])
  end

  def set_redirect
    redirect_to root_path if @chat.house_id != current_house.id
  end
end
