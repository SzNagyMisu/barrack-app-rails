class Admin::CommentsController < ApplicationController
  def create
    @user = User.find params[:user_id]
    @user.received_comments.create body: params.require(:comment)[:body], commenter: current_user
    redirect_to admin_user_path(@user)
  end
end
