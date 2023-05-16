class TrainingSessionsController < ApplicationController
  def index
    @sessions = params.key?(:q) ? TrainingSession.search(params[:q]) : TrainingSession.default
    @sessions = @sessions.includes :trainer
    @q = params.fetch :q, {}
    @registered_session_ids = current_user.registered_training_session_ids
  end

  def register
    @session = TrainingSession.find params[:id]
    @session.registered_users << current_user
    redirect_to training_sessions_path
  end

  def unregister
    @session = TrainingSession.find params[:id]
    @session.registered_users.delete current_user
    redirect_to training_sessions_path
  end

  def join
    @session = TrainingSession.find_by code: params[:code]
    joined_user_ids = @session.joined_user_ids.append(current_user.id).uniq
    @session.joined_user_ids = joined_user_ids
  rescue
    flash.now[:alert] = 'Wrong training session code'
    render :join_form
  end

  private
    
    def search_params
      params.require(:q).permit :date_from, :date_to, :trainer
    end
end
