class Article < ApplicationRecord

  belongs_to :user
  has_many :articleimages
  accepts_attachments_for :articleimages, attachment: :image
  attachment :image
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :shop_name, presence: true
  validates :store_address, presence: true
  validates :caption, presence: true
  validates :user, presence:true
  paginates_per 10
  belongs_to :category


  acts_as_taggable_on :genres
  default_scope -> { order(created_at: :desc) }

  def self.search(search) #self.でクラスメソッドとしている
          if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
            Project.where(['name LIKE ?', "%#{search}%"])
          else
            Project.all #全て表示。
          end
       end

  def self.search(category_name)
      category = Category.find_by(name: category_name)
      articles = category.articles
      return articles
  end


  def favorited_by?(user)
    favorites.where(user_id:user.id).exists?
  end


end
