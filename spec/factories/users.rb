FactoryBot.define do
  factory :user do
    nickname              {"aaa"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    name                  {"あああ"}
    surname               {"あああ"}
    surname_kana          {"アアア"}
    name_kana             {"アアア"}
    birthday              {"1999-01-01"}
  end
end