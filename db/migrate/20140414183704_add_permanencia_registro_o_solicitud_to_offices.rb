class AddPermanenciaRegistroOSolicitudToOffices < ActiveRecord::Migration
  def change
    add_column :offices, :kind, :string
  end
end
