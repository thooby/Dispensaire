FactoryGirl.define do
  factory :consultation do
    fecha Date.today
    association :patient
    association :tipeconsultation
    motif "Motif..."
    observation "Observation..."
    after_build { |c|
      c.consul_trats << FactoryGirl.build(:consul_trat, :consultation => c)
      c.consul_diags << FactoryGirl.build(:consul_diag, :consultation => c)      
      c.consul_motifs << FactoryGirl.build(:consul_motif, :consultation => c)      
    }
  end  
end  