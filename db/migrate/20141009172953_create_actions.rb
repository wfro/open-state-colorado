class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :bill, index: true
      t.string :date
      t.string :action
      t.string :actor

      t.timestamps
    end
  end
end
