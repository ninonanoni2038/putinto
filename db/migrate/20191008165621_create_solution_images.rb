class CreateSolutionImages < ActiveRecord::Migration[5.2]
  def change
    create_table :solution_images do |t|
      t.string :image
      t.references :solution
      t.timestamps null: false
    end
  end
end
