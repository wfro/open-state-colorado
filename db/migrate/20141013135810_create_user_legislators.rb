class CreateUserLegislators < ActiveRecord::Migration
  def change
    create_table :user_legislators do |t|
      t.references :user, index: true
      t.references :legislator, index: true

      t.timestamps
    end
  end
end
