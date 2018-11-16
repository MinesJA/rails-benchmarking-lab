class ChangeColumnsOnMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :vote_count, :integer
    add_column :movies, :vote_average, :float
  end
end
