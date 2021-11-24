FactoryBot.define do
  factory :item do
    name          {"いも"}
    explanation   {"芋掘り"}
    category_id   {"2"}
    status_id     {"2"}
    fee_id        {"3"}
    prefecture_id {"4"}
    schedule_id   {"5"}
    price         {"10000"}
    association :user
    # after(:build) do |item|
    #   item.image.attach(io: File.open('assets/images'), filename: 'comment.png')
    # end
  end
end
