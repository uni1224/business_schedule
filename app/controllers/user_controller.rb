class UserController < ApplicationController
    before_action :authenticate_user!
    before_action :set_current_user
    
    def edit
    end

    def update
      if @user.update(user_params)
           flash[:success] = '会員情報を更新しました'
           redirect_to mypage_path
      else
           flash[:danger] = '会員情報の更新に失敗しました'
           render :edit
      end
    end

  private

    def set_current_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:last_name, :first_name, :first_name_kana, :last_name_kana,:birthday,:profile_image,:email, :phone_number)
    end
end
