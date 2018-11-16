class CreateKeywordMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :keyword_movies do |t|
      t.integer :movie_id
      t.integer :keyword_id

      t.timestamps
    end
  end
end
