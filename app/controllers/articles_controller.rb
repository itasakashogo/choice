class ArticlesController < ApplicationController

  before_action :set_current_user
  before_action :authenticate_user!



  def top
      @article = Article.all.page(params[:page]).per(12)
      flash.now[:notice] = "こんにちは!! 本日は#{Date.today}です。"
      @tags = Article.all_tags
      @categories = Category.all
      @articles = Article.includes(:category)
  end



  def new
      @article = Article.new
      @user = User.find(current_user.id)
  end


  def index
      @articles = Article.all
      @users = User.all
      @articles = Article.tagged_with(params[:search])
      @tags_most = ActsAsTaggableOn::Tag.most_used(3) # 最も使われているタグを配列で取得
      @tags_least = ActsAsTaggableOn::Tag.least_used(3) # 最も使われていないタグを配列で取得
      @article = Article.includes(:category)
      @categories = Category.all
  end

  def show
      @article = Article.find(params[:id])
      @article_comment = ArticleComment.new
      @user = User.find_by(id: @article.user_id)
      @article_tag = Article.tagged_with(params[:genre_list])
      @categories = Category.all
      @articles = Article.includes(:category)
  end

#新しい方
  def create
    @article = Article.new(article_params)
    @user = User.find(current_user.id)
    @article.user_id = current_user.id
    if @article.save
      flash[:success] = "記事を作成しました"
      redirect_to root_path
    else
      render 'articles/new'
    end
 end


  def edit
    @article = Article.find(params[:id])
    @user = User.find(current_user.id)
  end

#新しい方
 def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "記事を更新しました"
      redirect_to root_path
    else
      render 'edit'
    end
 end



 private

   def article_params
    params.require(:article).permit(:shop_name,:caption,:user_id,:store_address,:image,:articleimages_images,:genre_list,:category_id)
   end

   def user_params
    params.require(:user).permit(:name, :email, :password, :profile_image,:article_id)
   end

   def category_params
    params.require(:category).permit(:name,:article_id)
   end


  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end



  def set_available_tags_to_gon
    gon.available_tags = Article.tags_on(:tags).pluck(:name)
  end


end