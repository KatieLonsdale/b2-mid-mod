class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  def department_worked_in
    department.name
  end

  def tickets_open
    tickets
  end
end