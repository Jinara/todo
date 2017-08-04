class RenameTodosToHoliTodos < ActiveRecord::Migration[5.1]
  def change
    rename_table :todos, :holi_todos
  end
end
