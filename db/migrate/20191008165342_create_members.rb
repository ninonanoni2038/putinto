class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :password_digest
      t.string :image
      t.timestamps null: false
    end
  end
end
