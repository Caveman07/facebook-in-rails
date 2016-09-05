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
        @user = User.find(current_user.id)
        @friend = User.find(params[:friend_id])
        if Friendship.accept(@user, @friend)
            flash[:success] = "Friend accepted"
            redirect_to :back
        end

      end

      def destroy
        @user = User.find(current_user.id)
        @friend = User.find(params[:friend_id])
        # @friendship = find_by_user_id_and_friend_id(@user, @friend)
        if Friendship.decline(@user, @friend)
          flash[:success] = "Friend declined"
          redirect_to :back
        end

      end





end
