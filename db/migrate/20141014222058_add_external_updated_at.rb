class AddExternalUpdatedAt < ActiveRecord::Migration
  def change
    add_column :bills, :external_updated_at, :datetime
  end
end
