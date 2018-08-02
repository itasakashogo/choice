class TagsController < ApplicationController
  def index
  	  @articles = Article.tagged_with(params[:search])
	  @tags_most = ActsAsTaggableOn::Tag.most_used(5) # 最も使われているタグを配列で取得
	  @tags_least = ActsAsTaggableOn::Tag.least_used(3) # 最も使われていないタグを配列で取得
	  @tags = Article.all_tags.page(params[:page]).per(5)
	  @categories = Category.all
  end
end