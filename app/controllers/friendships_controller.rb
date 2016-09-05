class FriendshipsController < ApplicationController
    before_action :authenticate_user!

      def create
        @user = User.find(current_user.id)
        @friend = User.find(params[:friend_id])
        if Friendship.send_request(@user, @friend)
            flash[:success] = "Friend request sent"
            redirect_to :back
        else
            flash[:alert] = "Friend request could not be sent"
            redirect_to :back
        end

      end

      def update
      end

      def destroy
      end





end
