class OpenStatesIdToExternalId < ActiveRecord::Migration
  def change
    rename_column :legislators, :open_states_id, :external_id
  end
end
