FactoryGirl.define do 
  factory :commune do
    sequence(:nom) {|n| "Commume #{n}"}
  end  
end