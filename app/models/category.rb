class Category < ApplicationRecord
 
 attachment :image
 has_many :articles
 paginates_per 6

  def self.publishable
    where(published: true)
  end

   def to_param
    name
  end

  def self.search(category_name)
    category = Category.find_by(name: category_name)
    articles = category.articles
    return articles
  end

  def self.search(search) #self.でクラスメソッドとしている
	  if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
	    Project.where(['name LIKE ?', "%#{search}%"])
	  else
	    Project.all #全て表示。
	  end
   end
end
