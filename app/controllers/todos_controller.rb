class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def new
  @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
    flash[:notice] = "保存しました"
    redirect_to todos_path
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end
  
  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    user = User.find(params[:user_id])
    todo = Todo.find(params[:id])
    todo.update(todo_params)
    flash[:notice] = "変更されました"
    redirect_to user_path(todo.user_id)
  end

  def destroy
    user = User.find(params[:user_id])
    todo = user.todos.find(params[:id])
    todo.delete
    flash[:notice] = "削除されました"
    redirect_to user_path(user)
  end

  private
  def todo_params
    params.require(:todo).permit(:date,:today,:tommorow,:week,:month,:check)
  end

end
