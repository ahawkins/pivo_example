require 'test_helper'

class CreateCustomerTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def test_persists_the_customer_in_the_database
    visit new_customer_path

    fill_in 'customer_form[name]', with: 'Adam'
    fill_in 'customer_form[account_number]', with: 'Oulu1234'

    click_button 'Add'

    assert_equal 1, CustomerRepo.count
    db = CustomerRepo.first

    assert_equal 'Adam', db.name
    assert_equal 'Oulu1234', db.account_number

    assert page.has_content?('Adam'), "App should display customer name after creating"
    assert page.has_content?('Oulu1234'), "App should display account number after creating"
  end
end
