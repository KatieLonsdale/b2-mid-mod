require 'rails_helper'

RSpec.describe 'employees show page' do
  before :each do
    test_data
  end

  describe "As a user, when I visit the Employee show page" do
    it "shows me the employee's name" do
      visit "/employees/#{@employee_1.id}"
      within "#employee-info" do
        expect(page).to have_content('Name: Roger')
      end

      visit "/employees/#{@employee_4.id}"
      within "#employee-info" do
        expect(page).to have_content('Name: Rebecca')
      end
    end

    it "shows me the employee's department" do
      visit "/employees/#{@employee_1.id}"
      within "#employee-info" do
        expect(page).to have_content('Department: IT')
      end

      visit "/employees/#{@employee_4.id}"
      within "#employee-info" do
        expect(page).to have_content('Department: Finance')
      end
    end

    xit "shows me all of their tickets from oldest to youngest" do

    end

    xit "shows me their oldest ticket separately" do

    end
  end
end