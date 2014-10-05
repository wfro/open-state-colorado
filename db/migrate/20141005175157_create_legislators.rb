class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :open_states_id
      t.string :district
      t.string :party
      t.string :email
      t.string :photo_url
      t.string :url
      t.timestamps
    end
  end
end
