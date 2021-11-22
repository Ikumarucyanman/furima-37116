FactoryBot.define do
  factory :user do
    nickname              {"imo"}
    email                 {"imo@imo"}
    password              {"000000"}
    password_confirmation {password}
    last_name             {"芋"}
    first_name            {"芋"} 
    last_name_kana        {"イモ"}
    first_name_kana       {"イモ"}
    birthday              {"1995-08-19"}
  end
end