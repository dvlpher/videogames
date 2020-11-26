class CreateVideoGames < ActiveRecord::Migration[6.0]
  def change
    create_table :video_games do |t|
      t.string :title
      t.string :rating
      t.string :difficulty_level

      t.timestamps
    end
  end
end
