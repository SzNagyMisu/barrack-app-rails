class Admin::TrainingSessionsController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'admin'

  def index
    @sessions = TrainingSession.default
  end

  def new
    @session = TrainingSession.new
  end

  def create
    @session = TrainingSession.new session_params
    @session.save!
    redirect_to admin_training_sessions_path
  rescue
    render :new
  end

  def edit
    @session = TrainingSession.find params[:id]
  end

  def update
    @session = TrainingSession.find params[:id]
    @session.update! session_params
    redirect_to admin_training_sessions_path
  rescue
    render :edit
  end

  def destroy
    @session = TrainingSession.find params[:id]
    @session.destroy!
    redirect_to admin_training_sessions_path
  end

  private

    def session_params
      params.require(:training_session).permit :start_time, :trainer_id
    end
end
