class Employee < ApplicationRecord
  belongs_to :department
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets

  def department_worked_in
    department.name
  end

  def tickets_by_age
    tickets.order(age: :desc)
  end

  def oldest_ticket_subject
    ticket = tickets_by_age.first
    return ticket.subject unless ticket.nil?
  end
end