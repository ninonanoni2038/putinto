class ChangeArticle < ActiveRecord::Migration[5.2]
  def change
    change_column :errors, :article, :string
  end
end
