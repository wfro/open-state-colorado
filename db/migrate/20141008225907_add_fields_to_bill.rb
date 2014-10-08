class AddFieldsToBill < ActiveRecord::Migration
  def change
    remove_column :bills, :open_states_id
    add_column :bills, :external_id, :string
    add_column :bills, :state, :string
    add_column :bills, :title, :string
    add_column :bills, :type, :string
  end
end
