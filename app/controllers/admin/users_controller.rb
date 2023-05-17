class Admin::UsersController < ApplicationController
  include AdminOnly

  def index
    @users = User.includes(:profile, :registered_training_sessions, :joined_training_sessions).all
  end

  def show
    @user = User.includes(received_comments: :commenter).find params[:id]
  end
end
