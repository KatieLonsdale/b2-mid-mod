require 'rails_helper'

RSpec.describe Ticket do
  describe 'relationships' do
    it {should have_many :employee_tickets}
  end
end