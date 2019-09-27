FactoryBot.define do

  factory :user do
  
    nickname {"abe"}
    email {"494a98sc8d@yahoo.co.jp"}
    password {"a111111"}
    password_confirmation {"a111111"}
    last_name {"田中"}
    first_name {"太郎"}
    last_name_kana {"タナカ"}
    first_name_kana {"タロウ"}
    birth_yyyy_id {1}
    birth_mm_id {1}
    birth_dd_id {1}
    phone_num {"08012345678"}
    authentication_num {1234}
    zip_code1 {"111-1111"}
    prefecture_id {"1"}
    city {"福岡"}
    address1 {"中央区"}
    payment_card_no {1020304050607080}
    paymentmonth_id {1}
    paymentyear_id {1}
    payment_card_security_code {1234}

    # nickname {"abe"}
    # first_name {"abe"}
    # last_name {"abe"}
    # first_name_kana {"ア"}
    # last_name_kana {"ア"}
    # birthday_year {1990}
    # birthday_month {1}
    # birthday_day {1}
    # phone_num {"08084932938"}
    # authentication_num {1234}
    # content {""}
    # id {1} 
    # email {"aaa@aaa"}
  end
  # factory :user do
  #   nickname {"abe"}
  #   first_name {"abe"}
  #   last_name {"abe"}
  #   first_name_kana {"ア"}
  #   last_name_kana {"ア"}
  #   birthday_year {"1990""}
  #   birthday_month {""}
  #   birthday_day {""}
  #   phone_num {"080-8654-7678"}
  #   authentication_num {"0000"}
  #   content {"abe"}
  # end

end
