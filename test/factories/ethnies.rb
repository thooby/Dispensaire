FactoryGirl.define do
  factory :ethnie do
    sequence(:nom) {|n| "Ethnie #{n}"}
  end  
end  