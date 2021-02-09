FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(6)
    nickname {"furima太郎"}
    email {Faker::Internet.free_email}
    password {password }
    password_confirmation {password}
    family_name {"山田"}
    family_name_kana {"ヤマダ"}
    first_name {"山太郎" }
    first_name_kana {"ヤマタロウ"}
    birth_date {"1930-1-1"}
  end
end
