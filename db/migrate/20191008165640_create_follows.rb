class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.references :mentor
      t.references :member
      t.timestamps null: false
    end
  end
end
