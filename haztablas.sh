rails  generate nifty:scaffold  Patient prenom:string nom:string carte_code:string fecha:date  sex_id:integer naissance:integer village_id:integer commune_id:integer ethnie_id:integer profession_id:integer 
rails  generate nifty:scaffold  Consultation fecha:date patient_id:integer tipeconsultation_id:integer observation:string
rails  generate nifty:scaffold  Sex description:string
rails  generate nifty:scaffold  Village nom:string commune_id:integer
rails  generate nifty:scaffold  Ethnie nom:string
rails  generate nifty:scaffold  Profession nom:string
rails  generate nifty:scaffold  Commune nom:string
rails  generate nifty:scaffold  Tipeconsultation tipe:string
rails  generate nifty:scaffold  Traitement groupe_traitement_id:integer acronime:string description:string
rails  generate nifty:scaffold  Groupe_traitement description:string
rails  generate nifty:scaffold  Diagnostic acronime:string description:string
rails  generate nifty:scaffold  Consul_trat consultation_id:integer traitement_id:integer 
rails  generate nifty:scaffold  Consul_diag consultation_id:integer diagnostic_id:integer
rails  generate nifty:layout
rails generate migration AddConsulItemsToConsultations motif:string tension_arteriale_haute:integer tension_arteriale_basse:integer pouls:integer temperature:decimal respiration:integer poids:integer analyses:string
rails generate migration AddPatientsItemsToPatients mois:integer jour:integer
