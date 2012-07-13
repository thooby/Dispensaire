FactoryGirl.define do
  factory :patient do
    prenom 'Dauda'
    nom 'Dembele'
    sequence(:carte_code) {|n| "#{n}A"}
    fecha Date.today
    naissance 1967
    association :sex
    association :commune
    association :village
    association :ethnie
    association :profession    
  end  
end  