class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user

  def show
    @events = Event.all
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "会員情報を更新しました"
      redirect_to mypage_path
    else
      flash[:danger] = "会員情報の更新に失敗しました"
      render :edit
    end
  end

  def quit
  end

  def out
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


  private
    def set_current_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :birthday, :profile_image, :email, :phone_number)
    end
end
