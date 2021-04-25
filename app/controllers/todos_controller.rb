class TodosController < ApplicationController
  before_action :authenticate_house!

  def index
    @todo =  Todo.new
    @todos = Todo.all.order(id: 'DESC')
    @users = User.where(house_id: current_house.id)
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
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
    @users = User.where(house_id: current_house.id)
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todo_path(@todo)
    else
      @users = User.where(house_id: current_house.id)
      render :edit
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:limit, :list, :user_name).merge(house_id: current_house.id)
  end
end
