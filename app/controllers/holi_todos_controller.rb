class HoliTodosController < ApplicationController

  def index
    @holi_todos = HoliTodo.all
  end

  def show
    @holi_todos = HoliTodo.find(params[:id])
  end

  def new
    @holi_todos = HoliTodo.new
  end

  def create
    @holi_todos = HoliTodo.new(holi_todos_params)
    @holi_todos.save ? success_response : failure_response
  end

  def edit
    @holi_todos = HoliTodo.find(params[:id])
  end

  def update
    @holi_todos = HoliTodo.find(params[:id])
    @holi_todos.update(holi_todos_params)
    @holi_todos.save ? success_response : failure_response
  end

  def destroy
    @holi_todos = HoliTodo.find(params[:id])
    @holi_todos.destroy
  end

  private
    def holi_todos_params
      params.require(:holi_todos).permit(:date, :description, :status)
    end
end
