FactoryBot.define do

  factory :user do
    nickname {"abe"}
    first_name {"abe"}
    last_name {"abe"}
    first_name_kana {"ア"}
    last_name_kana {"ア"}
    birthday_year {1990}
    birthday_month {1}
    birthday_day {1}
    phone_num {"08084932938"}
    authentication_num {1234}
    content {""}
    id {1} 
    email {"aaa@aaa"}
  end

end