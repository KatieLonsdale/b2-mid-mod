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
        expect(page).to have_no_content("Open tickets:")
    end

    it "shows me their oldest ticket separately" do
      visit "/employees/#{@employee_1.id}"
      within "#employee-oldest-ticket" do
        expect(page).to have_content("Oldest Ticket: Virus")
      end

      visit "/employees/#{@employee_4.id}"
        expect(page).to have_no_content("Oldest Ticket:")
    end

    it "does not show any tickets that aren't assigned to the employee" do
      visit "/employees/#{@employee_1.id}"
      within "#employee-tickets" do
        expect(page).to have_no_content("Subject: Monitor")
        expect(page).to have_no_content("Subject: Password")
      end
      visit "/employees/#{@employee_4.id}"
      within "#employee-tickets" do
        expect(page).to have_no_content("Subject: Email")
        expect(page).to have_no_content("Age: 2")
        expect(page).to have_no_content("Subject: Virus")
        expect(page).to have_no_content("Age: 6")
        expect(page).to have_no_content("Subject: Mouse")
        expect(page).to have_no_content("Age: 5")
        expect(page).to have_no_content("Open tickets:")
      end
    end

  
      # and I see a form to add a ticket to this department.
      # When I fill in the form with the id of a ticket that already exists in the database
      # and I click submit
      # Then I am redirected back to that employees show page
      # and I see the ticket's subject now listed.
      # (you do not have to test for sad path, for example if the id does not match an existing ticket.)
  end
end