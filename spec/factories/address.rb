FactoryBot.define do

  factory :address do
    familyname              {"山田"}
    firstname               {"太郎"}
    familyname_kana        {"ヤマダ"}
    firstname_kana         {"タロウ"}
    birth_year                {"1"}
    birth_month               {"1"}
    birth_day                 {"1"}     
    postal_code            {"123456"}
    prefecture                {"1"}   
    city                    {"中央区"}  
    block               {"日本橋１−１"} 
    user  
  end

end
