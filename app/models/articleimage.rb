class Articleimage < ApplicationRecord

  belongs_to :article
  attachment :image
end
