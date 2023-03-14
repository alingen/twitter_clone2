class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def withdrawal
    if current_user.update(is_deleted: true)
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    else
      render :show
    end
  end

  def show
    @user = User.find(params[:id])
  end


end
