class TrainingSessionsController < ApplicationController
  include WithLoggedInUser

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
    @session = TrainingSession.find_by! code: params[:code].downcase
    @session.join_user current_user
  rescue ActiveRecord::RecordNotFound
    flash.now[:alert] = 'Wrong training session code'
    render :join_form, status: :not_found
  rescue ActiveRecord::RecordInvalid
    flash.now[:alert] = 'Not enough balance to attend training session'
    render :join_form, status: :payment_required
  end

  private
    
    def search_params
      params.require(:q).permit :date_from, :date_to, :trainer
    end
end
