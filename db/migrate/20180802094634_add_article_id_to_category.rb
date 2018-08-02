class AddArticleIdToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :article_id, :integer
  end
end
