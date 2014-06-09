class CreateVehicles < ActiveRecord::Migration
  def change
    create_table "vehicles", :force => true do |t|
      t.string   "brand"
      t.string   "line"
      t.integer  "model",         :precision => 38, :scale => 0
      t.string   "plate"
      t.string   "serial_number"
      t.string   "color"
      t.boolean  "stolen",        :precision => 1,  :scale => 0
      t.string   "status"
      t.text     "details"
      t.integer  "person_id",     :precision => 38, :scale => 0
      t.datetime "created_at",                                   :null => false
      t.datetime "updated_at",                                   :null => false

      t.timestamps
    end
  end
end
