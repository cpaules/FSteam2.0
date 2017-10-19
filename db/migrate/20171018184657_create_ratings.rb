class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :rating_value
      t.string :comment

      t.timestamps
    end
  end
end
