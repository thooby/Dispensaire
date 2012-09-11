# -*- encoding : utf-8 -*-
Dispen3::Application.routes.draw do
  resources :diag_types
  resources :diag_officials
  resources :motifs
  resources :users
  resources :user_sessions
  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  
  match 'consul_diags/find' => 'consul_diags#find'
  match 'consul_diags/find_offi' => 'consul_diags#find_offi'
  match 'consul_diags/find_date_offi' => 'consul_diags#find_date_offi'
  
  match 'consul_diags/find_date' => 'consul_diags#find_date'
  match 'consultations/:id/new' => 'consultations#new',  :as => :enlace
  get 'consultations/:id' => 'consultations#show',  :as => :enlace2
  match 'search' => 'search#show', :as => :search
  
  
  resources :consul_motifs
  resources :consul_diags do
    post :find_date, :action => "find", :on => :collection
  end
  resources :consul_trats
  resources :diagnostics
  resources :groupe_traitements
  resources :traitements
  resources :tipeconsultations
  resources :communes
  resources :professions
  resources :ethnies
  resources :villages
  resources :sexes
  resources :consultations
  resources :patients
  match 'patients/update_village_select/:id', :controller=>'patients', :action => 'update_village_select'
  root :to => "welcome#index"
end
