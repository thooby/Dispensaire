FactoryGirl.define do 
  factory :village do
    sequence(:nom) {|n| "Village #{n}"}
    association :commune
  end  
end  