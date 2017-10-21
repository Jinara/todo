class HoliTodosController < ApplicationController

  def index
    status = params[:status]

    if status
      @holi_todos = HoliTodo.where(status: status)
    else
      @holi_todos = HoliTodo.all
    end
  end

  def show
    @holi_todo = HoliTodo.find(params[:id])
  end

  def new
    @holi_todo = HoliTodo.new
  end

  def create
    @holi_todo = HoliTodo.new(holi_todos_params)
    @holi_todo.status = "pending"

    if @holi_todo.save
      flash[:success] = "Holi todo was created"
      redirect_to holi_todos_path
    else
      flash[:error] = "An error has ocurred"
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
      flash[:success] = "Holi todo was updated"
      redirect_to holi_todos_path
    else
      flash[:error] = "An error has ocurred"
      render :edit
    end
  end

  def destroy
    @holi_todo = HoliTodo.find(params[:id])
    @holi_todo.destroy

    flash[:success] = "Holi todo was deleted"
    redirect_to holi_todos_path
  end

  private
    def holi_todos_params
      params.require(:holi_todo).permit(:date, :description, :status)
    end
end
