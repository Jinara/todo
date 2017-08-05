class HoliTodo < ApplicationRecord
  validates :status, :description, :date, presence: true

  before_save :set_status
  def set_status
    self.status ||= "created"
  end
end
