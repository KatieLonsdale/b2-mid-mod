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

    it "shows me all of their tickets from oldest to youngest" do
      visit "/employees/#{@employee_1.id}"
      within "#employee-tickets" do
        expect(page).to have_content("Subject: Email")
        expect(page).to have_content("Age: 2")
        expect(page).to have_content("Subject: Virus")
        expect(page).to have_content("Age: 6")
        expect(page).to have_content("Subject: Mouse")
        expect(page).to have_content("Age: 5")

        expect(@ticket_3.subject).to appear_before(@ticket_4.subject)
        expect(@ticket_4.subject).to appear_before(@ticket_1.subject)

        expect(page).to have_no_content("Subject: Monitor")
      end

      visit "/employees/#{@employee_4.id}"
      within "#employee-tickets" do
        expect(page).to have_no_content("Subject: Email")
        expect(page).to have_no_content("Age: 2")
        expect(page).to have_no_content("Subject: Virus")
        expect(page).to have_no_content("Age: 6")
        expect(page).to have_no_content("Subject: Mouse")
        expect(page).to have_no_content("Age: 5")
      end
    end

    xit "shows me their oldest ticket separately" do


    end
  end
end