class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :percent_completed, :default => 0
      t.integer :user_id
      t.integer :game_id
      

      t.timestamps
    end
  end
end
