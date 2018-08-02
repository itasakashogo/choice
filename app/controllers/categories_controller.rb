class CategoriesController < ApplicationController

  def show
  	@category = Category.find_by(name: params[:name])
  	@article = @category.articles
    @users = User.all
    @articles = Article.all.page(params[:page]).per(5)
    @categories = Category.all
  end


 private

   def article_params
    params.require(:article).permit(:shop_name,:caption,:user_id,:store_address,:image,:articleimages_images,:genre_list,:category_id)
   end


   def category_params
    params.require(:category).permit(:name,:article_id)
   end

   def user_params
    params.require(:user).permit(:name, :email, :password, :profile_image,:article_id)
   end

end
