class UsersController < ApplicationController

  def withdrawal
    current_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def show
  end
end
