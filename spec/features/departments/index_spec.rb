require 'rails_helper'

RSpec.describe 'departments index page' do
  before :each do
    test_data
    visit '/departments/index'
  end

  describe "As a user, when I visit the Department index page" do
    it "shows each department's name and floor" do
      within("#department-#{@department_1.id}") do
        expect(page).to have_content('Department: IT')
        expect(page).to have_content('Floor: 1')
        expect(page).to have_no_content('Department: Finance')

      end
      within("#department-#{@department_2.id}") do
        expect(page).to have_content('Department: Finance')
        expect(page).to have_content('Floor: 2')
      end
      within("#department-#{@department_3.id}") do
        expect(page).to have_content('Department: HR')
        expect(page).to have_content('Floor: 3')
        expect(page).to have_no_content('Floor: 2')

      end
    end
    it "has names of employees underneath each department" do
      within("#department-#{@department_1.id}") do
        expect(page).to have_content('Roger')
        expect(page).to have_content('Stacey')
        expect(page).to have_content('Steve')
        expect(page).to have_no_content('Rebecca')
      end
      within("#department-#{@department_2.id}") do
        expect(page).to have_content('Rebecca')
        expect(page).to have_content('Ella')
        expect(page).to have_no_content('Roger')
      end
      within("#department-#{@department_3.id}") do
        expect(page).to have_no_content('Roger')
        expect(page).to have_no_content('Rebecca')
      end
    end
  end
end