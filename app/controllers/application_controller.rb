class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  # すべてのページへのアクセスを認証されたユーザーのみに制限
  before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 名前のデータ操作を許可
  def configure_permitted_parameters
    added_attrs = [:name, :email]
    devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  end

  # ログアウト後のルーティングを設定
  def after_sign_out_path_for(resource)
    chat_rooms_path(resource)
  end

end
