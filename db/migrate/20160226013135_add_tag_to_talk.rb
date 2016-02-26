class AddTagToTalk < ActiveRecord::Migration
  def change
    add_column :talks, :tag, :string
  end
end
