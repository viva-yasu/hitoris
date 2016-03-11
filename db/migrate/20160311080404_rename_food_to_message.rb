class RenameFoodToMessage < ActiveRecord::Migration
  def change
    rename_table :foods, :messages
  end
end
