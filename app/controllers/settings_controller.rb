class SettingsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @user = current_user
    end
  
    def update
      @user = current_user
      if @user.update(user_params)
        redirect_to settings_path, notice: 'Settings updated successfully.'
      else
        render :index
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :profile_picture, :cover_photo, :notification_preferences)
    end
end
