class ChangeMotionToText < ActiveRecord::Migration
  def change
    change_column :votes, :motion, :text
  end
end
