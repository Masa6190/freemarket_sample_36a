FactoryBot.define do

  factory :address do
    familyname              {"山田"}
    firstname               {"太郎"}
    familyname_kana        {"ヤマダ"}
    firstname_kana         {"タロウ"}
    birth_year                {"1"}
    birth_month               {"1"}
    birth_day                 {"1"} 
    familyname_deliver       {"山田"}
    firstname_deliver        {"太郎"}
    familyname_deliver_kana  {"ヤマダ"}
    firstname_deliver_kana   {"タロウ"} 
    postal_code            {"123456"}
    prefecture                {"1"}   
    city                    {"中央区"}  
    block               {"日本橋１−１"} 
    user  
  end

end
