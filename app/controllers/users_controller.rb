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

  def update
    if current_user.update user_params
      redirect_to current_user
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:image)
  end
end
