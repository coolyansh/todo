class Item < ApplicationRecord
  validates :priority, presence: true, inclusion: { in: [ 0, 1, 2], message: "%{value} is not a valid value for priority" }
  validates :title, presence: true, length: { minimum: 3}
  validates :description, presence: true, length: { minimum: 5}
  validates :due_date, presence: true
end
