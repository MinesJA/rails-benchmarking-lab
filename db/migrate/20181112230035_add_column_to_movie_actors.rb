class AddColumnToMovieActors < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_actors, :character, :string
  end
end
