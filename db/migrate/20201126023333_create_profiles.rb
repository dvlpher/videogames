class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :percent_completed

      t.timestamps
    end
  end
end
