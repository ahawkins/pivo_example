
require 'test_helper'

class CreateCustomerTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  attr_reader :customer

  def setup
    super
    @customer = Customer.new
    @customer.name = 'Adam'
    @customer.account_number = '1234'
    CustomerRepo.save customer
  end

  def test_users_can_delete_customers
    visit customer_path(id: customer.id)

    click_button 'Delete'

    assert page.has_content?("#{customer.name} deleted!")

    assert_equal 0, CustomerRepo.count
  end
end
