FactoryBot.define do
  factory :order_domicile do
    token            {"tok_abcdefghijk00000000000000000"}
    postal_code      {"123-1234"}
    shipping_area_id { 2 }
    municipality     {"横浜市緑区"}
    address          {"青山1-1-1"}
    building_name    {"柳ビル103"}
    phone_number     {"08012345678"}
  end
end
