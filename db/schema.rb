# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20150302173157) do

  create_table "analysts", :force => true do |t|
    t.string   "analyst"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "first_name"
    t.string   "last_name1"
    t.string   "last_name2"
    t.integer  "area_id",         :precision => 38, :scale => 0
    t.boolean  "zone_supervisor", :precision => 1,  :scale => 0
    t.string   "department"
  end

  create_table "anb_investigations", :force => true do |t|
    t.string   "anb"
    t.string   "anb_content_type"
    t.integer  "anb_file_size",    :precision => 38, :scale => 0
    t.datetime "anb_updated_at"
    t.integer  "investigation_id", :precision => 38, :scale => 0
    t.integer  "analyst_id",       :precision => 38, :scale => 0
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.boolean  "visible",          :precision => 1,  :scale => 0
    t.string   "analyst_number"
  end

  create_table "areas", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "assignments", :force => true do |t|
    t.integer "user_id",   :precision => 38, :scale => 0
    t.string  "user_type"
    t.integer "role_id",   :precision => 38, :scale => 0
  end

  add_index "assignments", ["user_id", "user_type"], :name => "i_ass_use_id_use_typ"

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id",    :precision => 38, :scale => 0
    t.string   "auditable_type"
    t.integer  "associated_id",   :precision => 38, :scale => 0
    t.string   "associated_type"
    t.integer  "user_id",         :precision => 38, :scale => 0
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :precision => 38, :scale => 0, :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "backup_files", :force => true do |t|
    t.string   "file"
    t.integer  "event_id",    :precision => 38, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.text     "description"
  end

  create_table "clicks_activities", :force => true do |t|
    t.integer  "user_id",    :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "colaboration_areas", :force => true do |t|
    t.string   "area"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "colaboration_files", :force => true do |t|
    t.string   "file"
    t.text     "description"
    t.integer  "colaboration_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "colaboration_people", :force => true do |t|
    t.integer  "colaboration_id", :precision => 38, :scale => 0
    t.integer  "person_id",       :precision => 38, :scale => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "colaboration_phones", :force => true do |t|
    t.integer  "phone_id",        :precision => 38, :scale => 0
    t.integer  "colaboration_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "colaboration_vehicles", :force => true do |t|
    t.integer  "colaboration_id", :precision => 38, :scale => 0
    t.integer  "vehicle_id",      :precision => 38, :scale => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "colaboration_weapons", :force => true do |t|
    t.integer  "colaboration_id", :precision => 38, :scale => 0
    t.integer  "weapon_id",       :precision => 38, :scale => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "colaborations", :force => true do |t|
    t.datetime "colaboration_date"
    t.string   "received_for"
    t.string   "requesting_area"
    t.string   "claimant"
    t.integer  "status_id",             :precision => 38, :scale => 0
    t.integer  "area_id",               :precision => 38, :scale => 0
    t.integer  "analyst_id",            :precision => 38, :scale => 0
    t.datetime "reply_date"
    t.string   "replied_for"
    t.text     "observations"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "email"
    t.integer  "user_id",               :precision => 38, :scale => 0
    t.text     "searchable"
    t.integer  "colaboration_areas_id", :precision => 38, :scale => 0
    t.boolean  "cibernetica",           :precision => 1,  :scale => 0
    t.boolean  "dieid",                 :precision => 1,  :scale => 0
  end

  create_table "commontator_comments", :force => true do |t|
    t.string   "creator_type"
    t.integer  "creator_id",        :precision => 38, :scale => 0
    t.string   "editor_type"
    t.integer  "editor_id",         :precision => 38, :scale => 0
    t.integer  "thread_id",         :precision => 38, :scale => 0,                :null => false
    t.text     "body",                                                            :null => false
    t.datetime "deleted_at"
    t.integer  "cached_votes_up",   :precision => 38, :scale => 0, :default => 0
    t.integer  "cached_votes_down", :precision => 38, :scale => 0, :default => 0
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
  end

  add_index "commontator_comments", ["cached_votes_down"], :name => "i_com_com_cac_vot_dow"
  add_index "commontator_comments", ["cached_votes_up"], :name => "i_com_com_cac_vot_up"
  add_index "commontator_comments", ["creator_id", "creator_type", "thread_id"], :name => "c_id_and_c_type_and_t_id"
  add_index "commontator_comments", ["thread_id", "created_at"], :name => "i_com_com_thr_id_cre_at"

  create_table "commontator_subscriptions", :force => true do |t|
    t.string   "subscriber_type",                                :null => false
    t.integer  "subscriber_id",   :precision => 38, :scale => 0, :null => false
    t.integer  "thread_id",       :precision => 38, :scale => 0, :null => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "commontator_subscriptions", ["subscriber_id", "subscriber_type", "thread_id"], :name => "s_id_and_s_type_and_t_id", :unique => true
  add_index "commontator_subscriptions", ["thread_id"], :name => "i_com_sub_thr_id"

  create_table "commontator_threads", :force => true do |t|
    t.string   "commontable_type"
    t.integer  "commontable_id",   :precision => 38, :scale => 0
    t.datetime "closed_at"
    t.string   "closer_type"
    t.integer  "closer_id",        :precision => 38, :scale => 0
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "commontator_threads", ["commontable_id", "commontable_type"], :name => "c_id_and_c_type", :unique => true

  create_table "crimes", :force => true do |t|
    t.string   "crime"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "criminal_drugs", :force => true do |t|
    t.integer  "criminal_group_id", :precision => 38, :scale => 0
    t.integer  "drug_id",           :precision => 38, :scale => 0
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "criminal_groups", :force => true do |t|
    t.text     "description"
    t.integer  "vehicle_id",  :precision => 38, :scale => 0
    t.integer  "weapon_id",   :precision => 38, :scale => 0
    t.integer  "drug_id",     :precision => 38, :scale => 0
    t.integer  "area_id",     :precision => 38, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "criminal_vehicles", :force => true do |t|
    t.integer  "vehicle_id",        :precision => 38, :scale => 0
    t.integer  "criminal_group_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "criminal_weapons", :force => true do |t|
    t.integer  "weapon_id",         :precision => 38, :scale => 0
    t.integer  "criminal_group_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "drugs", :force => true do |t|
    t.string   "kind"
    t.integer  "quantity",     :precision => 38, :scale => 0
    t.text     "observations"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "event_drugs", :force => true do |t|
    t.integer  "event_id",   :precision => 38, :scale => 0
    t.integer  "drug_id",    :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "event_people", :force => true do |t|
    t.integer  "event_id",   :precision => 38, :scale => 0
    t.integer  "person_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "event_phones", :force => true do |t|
    t.integer  "event_id",   :precision => 38, :scale => 0
    t.integer  "phone_id",   :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "event_vehicles", :force => true do |t|
    t.integer  "event_id",   :precision => 38, :scale => 0
    t.integer  "vehicle_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "event_weapons", :force => true do |t|
    t.integer  "event_id",   :precision => 38, :scale => 0
    t.integer  "weapon_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "events", :force => true do |t|
    t.integer  "priority_id",     :precision => 38, :scale => 0
    t.datetime "event_date"
    t.text     "description"
    t.string   "address"
    t.string   "suburb"
    t.string   "locality"
    t.boolean  "victims",         :precision => 1,  :scale => 0
    t.boolean  "detained",        :precision => 1,  :scale => 0
    t.boolean  "suspects",        :precision => 1,  :scale => 0
    t.integer  "person_id",       :precision => 38, :scale => 0
    t.boolean  "vehicles",        :precision => 1,  :scale => 0
    t.integer  "vehicle_id",      :precision => 38, :scale => 0
    t.boolean  "drugs",           :precision => 1,  :scale => 0
    t.string   "drug_id"
    t.boolean  "weapons",         :precision => 1,  :scale => 0
    t.integer  "weapon_id",       :precision => 38, :scale => 0
    t.text     "observations"
    t.string   "backup_file"
    t.string   "source"
    t.integer  "area_id",         :precision => 38, :scale => 0
    t.integer  "crime_id",        :precision => 38, :scale => 0
    t.integer  "township_id",     :precision => 38, :scale => 0
    t.integer  "locality_id",     :precision => 38, :scale => 0
    t.integer  "place_id",        :precision => 38, :scale => 0
    t.integer  "analyst_id",      :precision => 38, :scale => 0
    t.integer  "status_id",       :precision => 38, :scale => 0
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.boolean  "gmaps",           :precision => 1,  :scale => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "tramo_carretero"
    t.text     "searchable"
    t.string   "area"
  end

  create_table "events_collections", :force => true do |t|
    t.integer  "priority_id",     :precision => 38, :scale => 0
    t.datetime "event_date"
    t.text     "description"
    t.string   "street"
    t.string   "interior_number"
    t.string   "suburb"
    t.string   "locality"
    t.integer  "person_id",       :precision => 38, :scale => 0
    t.integer  "vehicle_id",      :precision => 38, :scale => 0
    t.integer  "drug_id",         :precision => 38, :scale => 0
    t.integer  "weapon_id",       :precision => 38, :scale => 0
    t.text     "observations"
    t.string   "backup_file"
    t.string   "source"
    t.integer  "area_id",         :precision => 38, :scale => 0
    t.integer  "crime_id",        :precision => 38, :scale => 0
    t.integer  "township_id",     :precision => 38, :scale => 0
    t.integer  "locality_id",     :precision => 38, :scale => 0
    t.integer  "place_id",        :precision => 38, :scale => 0
    t.integer  "analyst_id",      :precision => 38, :scale => 0
    t.integer  "status_id",       :precision => 38, :scale => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  create_table "helpdesk_actions", :force => true do |t|
    t.integer  "helpdesk_id", :precision => 38, :scale => 0
    t.text     "description"
    t.integer  "user_id",     :precision => 38, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "helpdesk_screenshots", :force => true do |t|
    t.integer  "analyst_id",              :precision => 38, :scale => 0
    t.string   "analyst_number"
    t.integer  "helpdesk_id",             :precision => 38, :scale => 0
    t.string   "screenshot"
    t.string   "screenshot_content_type"
    t.boolean  "visible",                 :precision => 1,  :scale => 0
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.integer  "screenshot_file_size",    :precision => 38, :scale => 0
  end

  create_table "helpdesks", :force => true do |t|
    t.string   "problem"
    t.text     "description"
    t.integer  "analyst_id",  :precision => 38, :scale => 0
    t.boolean  "active",      :precision => 1,  :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "historical_archives", :force => true do |t|
    t.string   "route"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "location"
  end

  create_table "investigations", :force => true do |t|
    t.string   "folio"
    t.string   "ci"
    t.string   "penal_cause"
    t.string   "title"
    t.datetime "start_date"
    t.boolean  "visible",     :precision => 1,  :scale => 0
    t.text     "hide_reason"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "analyst_id",  :precision => 38, :scale => 0
  end

  create_table "iph_drugs", :force => true do |t|
    t.string   "kind"
    t.integer  "quantity",     :precision => 38, :scale => 0
    t.text     "observations"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "iph_id",       :precision => 38, :scale => 0
  end

  create_table "iph_images", :force => true do |t|
    t.integer  "iph_id",     :precision => 38, :scale => 0
    t.string   "name"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "iph_iph_drugs", :force => true do |t|
    t.integer  "iph_id",      :precision => 38, :scale => 0
    t.integer  "iph_drug_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "iph_iph_objects", :force => true do |t|
    t.integer  "iph_id",        :precision => 38, :scale => 0
    t.integer  "iph_object_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "iph_iph_people", :force => true do |t|
    t.integer  "iph_id",        :precision => 38, :scale => 0
    t.integer  "iph_person_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "iph_iph_vehicles", :force => true do |t|
    t.integer  "iph_id",         :precision => 38, :scale => 0
    t.integer  "iph_vehicle_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "iph_objects", :force => true do |t|
    t.integer  "amount",      :precision => 38, :scale => 0
    t.string   "object"
    t.text     "description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "iph_id",      :precision => 38, :scale => 0
  end

  create_table "iph_people", :force => true do |t|
    t.string   "ci"
    t.string   "first_name"
    t.string   "last_name1"
    t.string   "last_name2"
    t.string   "alias"
    t.datetime "birth_date"
    t.string   "originative"
    t.string   "genre"
    t.boolean  "record",       :precision => 1,  :scale => 0
    t.string   "profession"
    t.text     "observations"
    t.integer  "status_id",    :precision => 38, :scale => 0
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "iph_id",       :precision => 38, :scale => 0
  end

  create_table "iph_vehicles", :force => true do |t|
    t.string   "brand"
    t.string   "line"
    t.integer  "model",         :precision => 38, :scale => 0
    t.string   "plate"
    t.string   "serial_number"
    t.string   "color"
    t.boolean  "stolen",        :precision => 1,  :scale => 0
    t.text     "details"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "iph_id",        :precision => 38, :scale => 0
  end

  create_table "iph_weapons", :force => true do |t|
    t.string   "brand"
    t.string   "model"
    t.string   "serial_number"
    t.string   "weapon"
    t.string   "caliber"
    t.integer  "weapon_type_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer  "iph_id",         :precision => 38, :scale => 0
  end

  create_table "iphs", :force => true do |t|
    t.integer  "priority_id",     :precision => 38, :scale => 0
    t.datetime "iph_date"
    t.string   "folio"
    t.string   "office_number"
    t.text     "description"
    t.string   "address"
    t.string   "suburb"
    t.integer  "locality_id",     :precision => 38, :scale => 0
    t.integer  "state_id",        :precision => 38, :scale => 0
    t.string   "tramo_carretero"
    t.text     "observations"
    t.text     "searchable"
    t.integer  "user_id",         :precision => 38, :scale => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "latitude",        :precision => 38, :scale => 0
    t.integer  "longitude",       :precision => 38, :scale => 0
    t.string   "state"
    t.boolean  "vialidad",        :precision => 1,  :scale => 0
    t.boolean  "investigadora",   :precision => 1,  :scale => 0
    t.boolean  "peup",            :precision => 1,  :scale => 0
    t.integer  "iph_crime_id",    :precision => 38, :scale => 0
    t.integer  "crime_id",        :precision => 38, :scale => 0
  end

  create_table "justice_net_files", :force => true do |t|
    t.integer  "justice_net_id", :precision => 38, :scale => 0
    t.string   "name"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.text     "description"
  end

  create_table "justice_nets", :force => true do |t|
    t.string   "justicia_net_folio"
    t.datetime "received_date"
    t.integer  "analyst_id",         :precision => 38, :scale => 0
    t.text     "observations"
    t.datetime "replied_date"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "status_id",          :precision => 38, :scale => 0
    t.integer  "area_id",            :precision => 38, :scale => 0
    t.string   "consecutivo"
  end

  create_table "justice_people", :force => true do |t|
    t.integer  "person_id",      :precision => 38, :scale => 0
    t.integer  "justice_net_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "localities", :force => true do |t|
    t.integer  "township_id", :precision => 38, :scale => 0
    t.string   "locality"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "office_files", :force => true do |t|
    t.integer  "office_id",   :precision => 38, :scale => 0
    t.string   "file"
    t.string   "description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "office_people", :force => true do |t|
    t.integer  "person_id",  :precision => 38, :scale => 0
    t.integer  "office_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "office_phones", :force => true do |t|
    t.integer  "phone_id",   :precision => 38, :scale => 0
    t.integer  "office_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "office_vehicles", :force => true do |t|
    t.integer  "vehicle_id", :precision => 38, :scale => 0
    t.integer  "office_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "office_weapons", :force => true do |t|
    t.integer  "weapon_id",  :precision => 38, :scale => 0
    t.integer  "office_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "offices", :force => true do |t|
    t.datetime "office_date"
    t.datetime "received_date"
    t.string   "requesting_area"
    t.string   "claimant"
    t.string   "subject"
    t.integer  "area_id",                :precision => 38, :scale => 0
    t.integer  "status_id",              :precision => 38, :scale => 0
    t.integer  "analyst_id",             :precision => 38, :scale => 0
    t.datetime "replied_date"
    t.string   "office_number"
    t.text     "observations"
    t.integer  "user_id",                :precision => 38, :scale => 0
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "file"
    t.string   "received_office_number"
    t.integer  "priority_id",            :precision => 38, :scale => 0
    t.string   "kind"
  end

  create_table "offices_attachments", :force => true do |t|
    t.string   "attachment"
    t.string   "model"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size",    :precision => 38, :scale => 0
    t.datetime "attachment_updated_at"
    t.integer  "office_id",               :precision => 38, :scale => 0
  end

  create_table "pdf_investigations", :force => true do |t|
    t.string   "pdf"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size",    :precision => 38, :scale => 0
    t.datetime "pdf_updated_at"
    t.integer  "investigation_id", :precision => 38, :scale => 0
    t.integer  "analyst_id",       :precision => 38, :scale => 0
    t.boolean  "visible",          :precision => 1,  :scale => 0
    t.string   "analyst_number"
    t.text     "pdf_content"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "ci"
    t.string   "first_name"
    t.string   "last_name1"
    t.string   "last_name2"
    t.string   "alias"
    t.datetime "birth_date"
    t.string   "originative"
    t.string   "genre"
    t.boolean  "record",          :precision => 1,  :scale => 0
    t.string   "profession"
    t.text     "observations"
    t.integer  "status_id",       :precision => 38, :scale => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "registered_from"
    t.text     "searchable"
  end

  create_table "person_phones", :force => true do |t|
    t.integer  "person_id",  :precision => 38, :scale => 0
    t.integer  "phone_id",   :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "phones", :force => true do |t|
    t.string   "phone_number"
    t.string   "registered_from"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "places", :force => true do |t|
    t.string   "place"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "priorities", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "role"
    t.boolean  "protected",              :precision => 1, :scale => 0
    t.boolean  "super_admin",            :precision => 1, :scale => 0
    t.boolean  "analyst",                :precision => 1, :scale => 0
    t.boolean  "administrator",          :precision => 1, :scale => 0
    t.boolean  "supervisor",             :precision => 1, :scale => 0
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.boolean  "medios",                 :precision => 1, :scale => 0
    t.boolean  "ie_supervisor",          :precision => 1, :scale => 0
    t.boolean  "analysts_supervisor",    :precision => 1, :scale => 0
    t.boolean  "super_supervisor",       :precision => 1, :scale => 0
    t.boolean  "iph",                    :precision => 1, :scale => 0
    t.boolean  "iph_supervisor",         :precision => 1, :scale => 0
    t.boolean  "cibernetico",            :precision => 1, :scale => 0
    t.boolean  "supervisor_cibernetico", :precision => 1, :scale => 0
    t.boolean  "director_cibernetico",   :precision => 1, :scale => 0
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "statuses", :force => true do |t|
    t.string   "description"
    t.string   "status_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "detail"
  end

  create_table "tests", :force => true do |t|
    t.text     "description"
    t.datetime "date_file"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "townships", :force => true do |t|
    t.string   "township"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "units", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.integer  "analyst_id",             :precision => 38, :scale => 0
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.string   "email",                                                 :default => "", :null => false
    t.string   "encrypted_password",                                    :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :precision => 38, :scale => 0, :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role_id",                :precision => 38, :scale => 0
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "active",                 :precision => 1,  :scale => 0
    t.datetime "last_seen"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "i_users_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "role_id", :precision => 38, :scale => 0
    t.integer "user_id", :precision => 38, :scale => 0
  end

  create_table "vehicles", :force => true do |t|
    t.string   "brand"
    t.string   "line"
    t.integer  "model",           :precision => 38, :scale => 0
    t.string   "plate"
    t.string   "serial_number"
    t.string   "color"
    t.boolean  "stolen",          :precision => 1,  :scale => 0
    t.string   "status"
    t.text     "details"
    t.integer  "person_id",       :precision => 38, :scale => 0
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "registered_from"
  end

  create_table "weapon_types", :force => true do |t|
    t.string   "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "weapons", :force => true do |t|
    t.string   "brand"
    t.string   "model"
    t.string   "serial_number"
    t.string   "weapon"
    t.string   "caliber"
    t.integer  "person_id",      :precision => 38, :scale => 0
    t.integer  "weapon_type_id", :precision => 38, :scale => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

end
