class ChangeGenderColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :actors, :gender, :integer
  end
end
