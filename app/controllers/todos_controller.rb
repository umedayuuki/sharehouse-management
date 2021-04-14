class TodosController < ApplicationController
  before_action :authenticate_house!

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
    @users = User.where(house_id: current_house.id)
  end

  def create
    @users = User.all
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      @users = User.where(house_id: current_house.id)
      render :new
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
    @users = User.where(house_id: current_house.id)
  end

  def update
    todo = Todo.find(params[:id])
    todo.update(todo_params)
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
  end

  private
  
  def todo_params
    params.require(:todo).permit(:limit, :list, :user_name).merge(house_id: current_house.id)
  end
end
