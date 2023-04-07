require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'relationships' do
    it { should have_many :employees }
  end

  describe 'instance methods' do
    before :each do
      test_data
    end
    describe '#employees_in_dept' do
      it 'returns a sentence with employees in the department' do
        expect(@department_1.employees_in_dept).to eq('Roger, Stacey, and Steve')
        expect(@department_2.employees_in_dept).to eq('Rebecca and Ella')
      end
    end
  end
end