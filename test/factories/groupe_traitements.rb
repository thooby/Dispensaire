FactoryGirl.define do
  factory :groupe_traitement do
    sequence(:description) {|n| "Groupe Traitements #{n}"}
  end  
end