class DonationAddress
  include ActiveModel::Model
  attr_accessor :user_id, :postal_code, :prefecture, :city, :addresses, :building, :phone_number
end