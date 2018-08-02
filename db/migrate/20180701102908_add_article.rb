class AddArticle < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :article_id, :integer
  end
end
