class CreateErrorImages < ActiveRecord::Migration[5.2]
  def change
    create_table :error_images do |t|
      t.string :image
      t.references :error
      t.timestamps null: false
    end
  end
end
