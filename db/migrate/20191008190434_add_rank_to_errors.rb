class AddRankToErrors < ActiveRecord::Migration[5.2]
  def change
    add_column :errors, :rank , :integer ,default: 1
  end
end
