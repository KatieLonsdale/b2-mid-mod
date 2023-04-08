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

    it "has a form to add a ticket by id to the employee" do
      visit "/employees/#{@employee_1.id}"
      within "#add-ticket" do
        expect(page).to have_content("Add Ticket:")
        fill_in(:ticket_id, with: "#{@ticket_2.id}")
        click_button("Add")
      end
    end

    it "returns to the employee show page when submitted" do
      visit "/employees/#{@employee_1.id}"
      within "#add-ticket" do
        fill_in(:ticket_id, with: "#{@ticket_2.id}")
        click_button("Add")
      end
      expect(current_path).to eq("/employees/#{@employee_1.id}")
    end

    it "and the ticket's subject is now listed" do
      visit "/employees/#{@employee_1.id}"
      expect(page).to have_no_content("Subject: Monitor")
      within "#add-ticket" do
        fill_in(:ticket_id, with: "#{@ticket_2.id}")
        click_button("Add")
      end
      expect(page).to have_content("Subject: Monitor")
    end
  end
end