FactoryGirl.define do
  factory :diagnostic do
    acronime "ASX"
    sequence(:description) {|n| "Diagnostic #{n}"}
  end  
end