FactoryBot.define do
  factory :item do
    name          {"いも"}
    explanation   {"芋掘り"}
    category_id   {"1"}
    status_id     {"2"}
    fee_id        {"3"}
    prefecture_id {"4"}
    schedule_id   {"5"}
    price         {"10000"}
  end
end
