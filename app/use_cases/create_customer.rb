class CreateCustomer
  attr_reader :customer_form

  def initialize(customer_form)
    @customer_form = customer_form
  end

  def run!
    customer = Customer.new

    customer.name = customer_form.name
    customer.account_number = customer_form.account_number

    CustomerRepo.save customer
    # customer.save

    customer
  end
end
