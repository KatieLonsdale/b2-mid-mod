class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :employees, through: :employee_tickets
end