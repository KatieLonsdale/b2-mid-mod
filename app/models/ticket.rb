class Ticket < ApplicationRecord
  has_many :employee_tickets
  has_many :tickets, through: :employee_tickets
end