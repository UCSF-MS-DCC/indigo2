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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200205174558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allele_frequencies", force: :cascade do |t|
    t.string   "locus"
    t.string   "genotype"
    t.string   "disease"
    t.integer  "n_of_cohort"
    t.integer  "collaborator_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.decimal  "frequency",       precision: 4, scale: 3
    t.index ["collaborator_id"], name: "index_allele_frequencies_on_collaborator_id", using: :btree
  end

  create_table "collaborators", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "expected_discovery"
    t.string   "demographic"
    t.string   "disease"
    t.string   "sequence_type"
  end

  create_table "consensus_fastqs", force: :cascade do |t|
    t.string   "INDIGO_ID"
    t.string   "gene"
    t.text     "fastq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gwas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "url"
  end

  create_table "gwas_samples", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sample_id"
    t.integer  "gwas_id"
  end

  create_table "haplotype_frequencies", force: :cascade do |t|
    t.string   "allele1"
    t.string   "allele2"
    t.string   "allele3"
    t.string   "allele4"
    t.string   "allele5"
    t.string   "allele6"
    t.decimal  "frequency",  precision: 6, scale: 3
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "source"
    t.string   "pmid_ref"
    t.string   "race"
    t.string   "ethnicity"
    t.string   "disease"
    t.integer  "total_n"
  end

  create_table "hlas", force: :cascade do |t|
    t.string   "indigo_id"
    t.string   "drb1_15_copies_calculated"
    t.string   "drb1_1"
    t.string   "drb1_2"
    t.string   "dqb1_1"
    t.string   "dqb1_2"
    t.string   "dpb1_1"
    t.string   "dpb1_2"
    t.string   "a_1"
    t.string   "a_2"
    t.string   "b_1"
    t.string   "b_2"
    t.string   "c_1"
    t.string   "c_2"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "sample_id"
    t.string   "dpa1_1"
    t.string   "dpa1_2"
    t.string   "dqa1_1"
    t.string   "dqa1_2"
    t.string   "drbo_1"
    t.string   "drbo_2"
    t.string   "dpb1_phase_ambiguities"
    t.string   "version"
    t.text     "original_data_source"
    t.string   "drb345_1"
    t.string   "drb345_2"
    t.boolean  "uploaded_to_immport"
    t.date     "immport_upload_date"
    t.index ["sample_id"], name: "index_hlas_on_sample_id", using: :btree
  end

  create_table "kir2019s", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "sample_id"
    t.string   "indigo_id"
    t.string   "kir2dl4_1"
    t.string   "kir2dl4_2"
    t.string   "kir2dl4_status"
    t.string   "kir2dl23_1"
    t.string   "kir2dl23_2"
    t.string   "kir2dl23_status"
    t.string   "kir3dl1s1_1"
    t.string   "kir3dl1s1_2"
    t.string   "kir3dl1s1_status"
    t.string   "kir3dl2_1"
    t.string   "kir3dl2_2"
    t.string   "kir3dl2_status"
    t.string   "kir3dl3_1"
    t.string   "kir3dl3_2"
    t.string   "kir3dl3_status"
    t.boolean  "uploaded_to_immport"
    t.date     "immport_upload_date"
    t.string   "v_ping_kir3dl1s1"
    t.string   "v_ping_kir2dl23"
    t.string   "v_ping_kir3dl3"
    t.string   "v_ping_kir2ds35"
    t.string   "v_ping_kir2dl5"
    t.string   "v_ping_kir2dl4"
    t.string   "v_ping_kir2dl1"
    t.string   "v_ping_kir2ds4"
    t.string   "kir2dl1_1"
    t.string   "kir2dl1_2"
    t.string   "kir2dl1_status"
    t.index ["sample_id"], name: "index_kir2019s_on_sample_id", using: :btree
  end

  create_table "kir_genotype_wips", force: :cascade do |t|
    t.string   "locus"
    t.string   "status"
    t.text     "output_directory"
    t.text     "kir_extracted_directory"
    t.text     "raw_data_directory"
    t.string   "batch"
    t.string   "method"
    t.string   "method_version"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "genotype"
    t.integer  "sample_id"
    t.boolean  "most_recent"
    t.index ["sample_id"], name: "index_kir_genotype_wips_on_sample_id", using: :btree
  end

  create_table "kirs", force: :cascade do |t|
    t.string   "indigo_id"
    t.string   "KIR3DL2"
    t.string   "KIR2DS5"
    t.string   "KIR2DL4"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.text     "KIR3DL1"
    t.text     "KIR3DS1"
    t.integer  "sample_id"
    t.text     "KIR2DL1"
    t.text     "KIR2DL2"
    t.text     "KIR2DL3"
    t.text     "KIR2DL5A"
    t.text     "KIR2DL5B"
    t.text     "KIR2DS1"
    t.text     "KIR2DS2"
    t.text     "KIR2DS3"
    t.text     "KIR2DS4"
    t.text     "KIR2DP1"
    t.text     "KIR3DL3"
    t.date     "raw_data_at_ucsf"
    t.boolean  "uploaded_to_immport"
    t.date     "immport_upload_date"
  end

  create_table "mg_clinicals", force: :cascade do |t|
    t.string   "achr"
    t.string   "musk"
    t.string   "lrp4"
    t.string   "agrin"
    t.string   "titin"
    t.string   "netrin_1"
    t.string   "caspr2"
    t.string   "seronegative"
    t.string   "anti_ache"
    t.string   "steroid"
    t.string   "immunosuppresant"
    t.string   "biologicals"
    t.string   "last_obs_anti_ache"
    t.string   "last_obs_steroid"
    t.string   "last_obs_immunosuppressant"
    t.string   "last_obs_biologicals"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "sample_id"
    t.string   "histological_dx_involuted_thymus"
    t.string   "histological_dx_hyperplasic_thymus"
    t.string   "histological_dx_thymoma"
    t.string   "mg_type"
    t.string   "thymectomy"
    t.index ["sample_id"], name: "index_mg_clinicals_on_sample_id", using: :btree
  end

  create_table "nmo_clinicals", force: :cascade do |t|
    t.integer  "sample_id"
    t.string   "anti_aqp4_antibodies"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "anti_mog_igg_ab"
    t.text     "notes"
    t.index ["sample_id"], name: "index_nmo_clinicals_on_sample_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tagsline"
    t.index ["user_id"], name: "index_notes_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "samples", force: :cascade do |t|
    t.string   "sample_source_study"
    t.string   "disease"
    t.string   "received_date"
    t.string   "indigo_id"
    t.string   "sample_source_identifier"
    t.string   "gender"
    t.string   "ethnicity"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "age_at_sample"
    t.string   "race"
    t.integer  "age_of_onset"
    t.boolean  "hla_geno"
    t.boolean  "pre_2019_kir_geno"
    t.boolean  "kir_raw"
    t.string   "sample_source"
    t.string   "date_to_stanford"
    t.string   "ngs_dataset"
    t.integer  "collaborator_id"
    t.string   "gwas_name"
    t.text     "gwas_url"
    t.string   "notes"
    t.boolean  "exclude"
    t.boolean  "kir_geno"
    t.boolean  "uploaded_to_immport"
    t.date     "immport_upload_date"
    t.string   "aao_range"
    t.index ["collaborator_id"], name: "index_samples_on_collaborator_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "note_id"
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_tags_on_note_id", using: :btree
    t.index ["topic_id"], name: "index_tags_on_topic_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "affiliation"
    t.boolean  "approved",                          default: false
    t.string   "authentication_token",   limit: 30
    t.boolean  "sent_approved_email"
    t.index ["approved"], name: "index_users_on_approved", using: :btree
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.index ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key", using: :btree
    t.index ["version_id"], name: "index_version_associations_on_version_id", using: :btree
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.integer  "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
    t.index ["transaction_id"], name: "index_versions_on_transaction_id", using: :btree
  end

  add_foreign_key "allele_frequencies", "collaborators"
  add_foreign_key "hlas", "samples"
  add_foreign_key "kir2019s", "samples"
  add_foreign_key "mg_clinicals", "samples"
  add_foreign_key "nmo_clinicals", "samples"
  add_foreign_key "notes", "users"
  add_foreign_key "tags", "notes"
  add_foreign_key "tags", "topics"
end
