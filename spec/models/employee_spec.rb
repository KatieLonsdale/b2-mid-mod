require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    it { should belong_to :department }
    it {should have_many :employee_tickets}
  end

  describe "instance methods" do
    before :each do
      test_data
    end
    describe "department_worked_in" do
      it 'returns the name of the department they belong to' do
        expect(@employee_1.department_worked_in).to eq('IT')
        expect(@employee_2.department_worked_in).to eq('IT')
        expect(@employee_4.department_worked_in).to eq('Finance')
      end
    end
  end
end