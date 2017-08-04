class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :description, null: false
      t.datetime :date, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
