class AddUuidToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :uuid, :string
  end
end
