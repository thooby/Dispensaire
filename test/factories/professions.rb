FactoryGirl.define do
  factory :profession do
    sequence(:nom) {|n| "Profession #{n}"}
  end  
end