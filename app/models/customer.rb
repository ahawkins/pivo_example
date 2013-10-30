class Customer
  include Chassis::Repo::Delegation

  attr_accessor :name, :account_number, :id
end
