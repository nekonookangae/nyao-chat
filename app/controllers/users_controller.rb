class UsersController < ApplicationController
  # ユーザー一覧を表示
  def index
    @users = User.all
  end

  # マイページを表示
  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
