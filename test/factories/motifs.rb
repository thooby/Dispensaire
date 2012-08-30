FactoryGirl.define do
  factory :motif do
    sequence(:description) {|n| "Motif #{n}"}
  end  
end