class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable

  has_many :articles
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image
  attachment :profile_image
  has_many :profiles


  def self.find_or_create_from_auth_hash(auth_hash)
   provider = auth_hash[:provider] #providerはどのサービスで認証したのかを見分けるもの
   uid = auth_hash[:uid]
   name = auth_hash[:info][:name]
   image_url = auth_hash[:info][:image]

   #find_or_create_by()は()の中の条件のものが見つければ取得し、なければ新しく作成するというメソッド
   self.find_or_create_by(provider: provider,uid: uid) do |user|
     user.username = name
     user.image_url = image_url
   end
  end

end
