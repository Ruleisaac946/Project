class NotificationsController < ApplicationController
    before_action :authenticate_user!
    def index
        @user = current_user
        @notifications = current_user.recieved_notifications
        render :index
    end


end
