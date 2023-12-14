class NotificationsController < ApplicationController
    before_action :authenticate_user!
    def index
        @user = current_user
        @notifications = current_user.recieved_notifications
        render :index
    end

    def destroy
        @notification = Notification.find(params[:id])
        @notification.destroy
        flash[:success] = 'Notification read'
        redirect_to notifications_url, status: :see_other
    end


end
