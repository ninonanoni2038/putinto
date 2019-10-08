class CreateMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :mentors do |t|
      t.string :name
      t.string :password_digest
      t.string :image
      t.timestamps null: false
    end
  end
end
