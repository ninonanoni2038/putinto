class CreateErrors < ActiveRecord::Migration[5.2]
  def change
    create_table :errors do |t|
      t.text :want
      t.text :timing
      t.text :detail
      t.text :challenge
      t.string :article
      t.integer :article
      t.references :member
      t.timestamps null: false
    end
  end
end
