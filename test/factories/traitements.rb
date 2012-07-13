FactoryGirl.define do
  factory :traitement do
    acronime "TRE"
    sequence(:description) {|n| "Ethnie #{n}"}
    association :groupe_traitement
  end  
end