class CreateNoVotes < ActiveRecord::Migration
  def change
    create_table :no_votes do |t|
      t.references :vote, index: true
      t.string :leg_id
      t.timestamps
    end
  end
end
