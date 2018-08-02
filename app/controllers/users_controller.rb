class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]


  def edit
     @user = User.find(current_user.id)
  end

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end


def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])#request.env['omniauth.auth']はTwitter認証で得た情報を格納するもの
    if user
      session[:user_id] = user.id
      redirect_to '/articles/root', notice: "ログインしました。"
    else
      redirect_to root_path, notice: "失敗しました。"
    end
  end


 def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     redirect_to user_path(@user)
     flash[:notice] = "更新しました"
  else
    render :edit
  end
 end

  private

   def article_params
    params.require(:article).permit(:shop_name,:caption,:user_id,:store_address,:image,articleimages_images: [])
   end

  def user_params
    params.require(:user).permit(:name, :email, :password, :profile_image,:article_id)
  end


    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
      redirect_to(root_url) unless current_user?(@user)

    end
end

