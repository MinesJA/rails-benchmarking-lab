class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.float :rating
      t.integer :user_id
      t.integer :movie_id
      t.integer :timestamp

      t.timestamps
    end
  end
end
