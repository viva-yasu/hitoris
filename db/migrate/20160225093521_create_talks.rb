class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.string :detail
      t.string :image
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
