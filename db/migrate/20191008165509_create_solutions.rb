class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.string :article
      t.text :detail
      t.references :error
      t.references :mentor
      t.timestamps null: false
    end
  end
end
