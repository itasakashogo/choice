module SessionsHelper
	  # 与えられたユーザーをログイン
  def log_in(user)
    session[:user_id] = user.id
  end

  # 永続セッションとしてユーザーを記憶する
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # 与えられたユーザーがログイン済みユーザーであればtrueを返す
  def current_user?(user)
    user == current_user
  end
end
