class CustomersController < ApplicationController
  def new
    @customer_form = CustomerForm.new
  end

  def create
    customer_form = CustomerForm.new params[:customer_form]
    use_case = CreateCustomer.new customer_form
    customer = use_case.run!

    redirect_to customer_path(id: customer.id)
  end

  def show
    @customer = CustomerRepo.find params[:id].to_i
  end

  def destroy
    @customer = CustomerRepo.find params[:id].to_i
    CustomerRepo.delete @customer

    flash[:notice] = "#{@customer.name} deleted!"

    redirect_to new_customer_path
  end
end
