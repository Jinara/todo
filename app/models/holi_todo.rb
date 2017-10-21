class HoliTodo < ApplicationRecord
  validates :status, :description, :date, presence: true
end
