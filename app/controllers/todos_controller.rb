class TodosController < ApplicationController
  before_action :authenticate_house!
  before_action :set_users, only: [:index, :edit]
  before_action :set_find_todo, only: [:show, :edit, :update, :destroy]
  before_action :set_redirect, only: [:show, :edit]

  def index
    @todo = Todo.new
    @todos = Todo.all.order(id: 'DESC')
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to action: :index
    else
      @todos = Todo.all.order(id: 'DESC')
      @users = User.where(house_id: current_house.id)
      render :index
    end
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to todo_path(@todo)
    else
      @users = User.where(house_id: current_house.id)
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:limit, :list, :user_name).merge(house_id: current_house.id)
  end

  def set_users
    @users = User.where(house_id: current_house.id)
  end

  def set_find_todo
    @todo = Todo.find(params[:id])
  end
  
  def set_redirect
    redirect_to root_path if @todo.house_id != current_house.id
  end

end
