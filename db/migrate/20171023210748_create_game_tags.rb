class CreateGameTags < ActiveRecord::Migration[5.0]
  def change
    create_table :game_tags do |t|
      t.integer :game_id
      t.integer :tag_id
    end
  end
end
