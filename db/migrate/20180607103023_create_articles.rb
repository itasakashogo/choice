class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :shop_name
      t.text :image_id
      t.text :caption
      t.integer :user_id
      t.text :store_address

      t.timestamps
    end
  end
end
