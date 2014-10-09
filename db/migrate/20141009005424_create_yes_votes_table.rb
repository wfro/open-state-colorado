class CreateYesVotesTable < ActiveRecord::Migration
  def change
    create_table :yes_votes do |t|
      t.string :leg_id
      t.references :vote, index: true
      t.timestamps
    end
  end
end
