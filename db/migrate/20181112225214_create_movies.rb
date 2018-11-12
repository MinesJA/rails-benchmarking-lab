class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.string :tagline
      t.float :runtime
      t.float :popularity
      t.string :original_language
      t.integer :budget
      t.integer :revenue
      t.string :status

      t.timestamps
    end
  end
end
