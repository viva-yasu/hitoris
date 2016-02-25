class AddTalkIdToFood < ActiveRecord::Migration
  def change
    add_column :foods, :talk_id, :integer
  end
end
