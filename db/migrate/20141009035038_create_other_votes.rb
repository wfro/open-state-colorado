class CreateOtherVotes < ActiveRecord::Migration
  def change
    create_table :other_votes do |t|
      t.references :vote, index: true
      t.string :leg_id

      t.timestamps
    end
  end
end
