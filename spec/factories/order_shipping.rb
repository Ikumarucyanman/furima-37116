FactoryBot.define do
  factory :order_shipping do
    postal_code   {"200-2200"}
    prefecture_id {"12"}
    city          {"名古屋市港区"}
    addresses     {"港明1-1-1"}
    building      {"大名古屋ビルディング"}
    phone_number  {"09012345678"}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end