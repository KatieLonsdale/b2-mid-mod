require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    it { should belong_to :department }
    it {should have_many :employee_tickets}
    it {should have_many :tickets}
  end

  describe "instance methods" do
    before :each do
      test_data
    end
    describe "#department_worked_in" do
      it 'returns the name of the department they belong to' do
        expect(@employee_1.department_worked_in).to eq('IT')
        expect(@employee_2.department_worked_in).to eq('IT')
        expect(@employee_4.department_worked_in).to eq('Finance')
      end
    end
    describe "tickets_by_age" do
      it 'returns an array of tickets associated with the employee from oldest to youngest age' do
        expect(@employee_1.tickets_by_age).to eq([@ticket_3, @ticket_4, @ticket_1])
        expect(@employee_3.tickets_by_age).to eq([@ticket_4, @ticket_5])
        expect(@employee_2.tickets_by_age).to eq([])
      end
    end
    describe "oldest_ticket_subject" do
      it 'returns the oldest ticket subject' do
        expect(@employee_1.oldest_ticket_subject).to eq('Virus')
        expect(@employee_3.oldest_ticket_subject).to eq('Mouse')
        expect(@employee_2.oldest_ticket_subject).to eq(nil)
      end
    end
  end
end