class CreateArticleimages < ActiveRecord::Migration[5.2]
  def change
    create_table :articleimages do |t|
      t.integer :article_id
      t.string :image_id

      t.timestamps
    end
  end
end
