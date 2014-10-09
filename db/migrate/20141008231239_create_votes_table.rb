class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :bill, index: true
      t.string :motion
      t.string :chamber
      t.string :date
      t.string :external_id
      t.string :yes_count
      t.string :no_count
      t.string :other_count
      t.timestamps
    end
  end
end
