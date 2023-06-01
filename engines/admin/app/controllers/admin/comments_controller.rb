class Admin::CommentsController < Admin::ApplicationController
  def create
    @user = User.find params[:user_id]
    @user.received_comments.create body: params.require(:comment)[:body], commenter: current_user
    redirect_to user_path(@user)
  end
end
