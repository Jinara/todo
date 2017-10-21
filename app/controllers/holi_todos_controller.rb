class HoliTodosController < ApplicationController

  def index
    @holi_todos = HoliTodo.all
  end

  def show
    @holi_todo = HoliTodo.find(params[:id])
  end

  def new
    @holi_todo = HoliTodo.new
  end

  def create
    @holi_todo = HoliTodo.new(holi_todos_params)
    @holi_todo.status = "created"
    if @holi_todo.save
      redirect_to holi_todos_path
    else
      flash.now[:error] = "pos ño"
      render :new
    end
  end

  def edit
    @holi_todo = HoliTodo.find(params[:id])
  end

  def update
    @holi_todo = HoliTodo.find(params[:id])
    @holi_todo.update(holi_todos_params)
    if @holi_todo.save
      redirect_to holi_todos_path
    else
      render :edit
    end
  end

  def destroy
    @holi_todo = HoliTodo.find(params[:id])
    @holi_todo.destroy
    redirect_to holi_todos_path
  end

  private
    def holi_todos_params
      params.require(:holi_todo).permit(:date, :description)
    end
end
