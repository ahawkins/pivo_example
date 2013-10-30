class CustomerForm < Chassis::Form
  extend ActiveModel::Naming

  attribute :name, String
  attribute :account_number, String

  def to_key
    nil
  end
end
