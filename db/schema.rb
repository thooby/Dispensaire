# -*- encoding : utf-8 -*-
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110404082140) do

  create_table "communes", :force => true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consul_diags", :force => true do |t|
    t.integer  "consultation_id"
    t.integer  "diagnostic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consul_trats", :force => true do |t|
    t.integer  "consultation_id"
    t.integer  "traitement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultations", :force => true do |t|
    t.date     "fecha"
    t.integer  "patient_id"
    t.integer  "tipeconsultation_id"
    t.string   "observation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "motif"
    t.integer  "tension_arteriale_haute"
    t.integer  "tension_arteriale_basse"
    t.integer  "poul"
    t.decimal  "temperature"
    t.integer  "respiration"
    t.integer  "poid"
    t.string   "analyse"
  end

  create_table "diagnostics", :force => true do |t|
    t.string   "acronime"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ethnies", :force => true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupe_traitements", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "prenom"
    t.string   "nom"
    t.string   "carte_code"
    t.date     "fecha"
    t.integer  "sex_id"
    t.integer  "naissance"
    t.integer  "village_id"
    t.integer  "commune_id"
    t.integer  "ethnie_id"
    t.integer  "profession_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mois"
    t.integer  "jour"
  end

  create_table "professions", :force => true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sexes", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipeconsultations", :force => true do |t|
    t.string   "tipe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "traitements", :force => true do |t|
    t.integer  "groupe_traitement_id"
    t.string   "acronime"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "villages", :force => true do |t|
    t.string   "nom"
    t.integer  "commune_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
