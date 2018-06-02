class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  # すべてのページへのアクセスを認証されたユーザーのみに制限
  before_action :authenticate_user!
end
