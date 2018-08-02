class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps

      add_index :articles,[:user_id,:created_at]
    end
  end
end
