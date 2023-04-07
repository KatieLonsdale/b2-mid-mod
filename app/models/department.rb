class Department < ApplicationRecord
  has_many :employees
  
  def employees_in_dept
    employees.pluck(:name).to_sentence
  end
end