class AddDobColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :dob, :integer
  end
end
