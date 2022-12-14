class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def withdrawal
    if current_user.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    else
      render user_path
    end
  end

  def show
  end
end
