class Admin::TrainingSessionsController < Admin::ApplicationController
  include Admin::AdminOnly

  def index
    @sessions = TrainingSession.default
  end

  def show
    @session = TrainingSession
      .includes(registered_users: :profile, joined_users: :profile)
      .find params[:id]
  end

  def new
    @session = TrainingSession.new
  end

  def create
    @session = TrainingSession.new session_params
    @session.save!
    redirect_to training_sessions_path
  rescue
    render :new
  end

  def edit
    @session = TrainingSession.find params[:id]
  end

  def update
    @session = TrainingSession.find params[:id]
    @session.update! session_params
    redirect_to training_sessions_path
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  def destroy
    @session = TrainingSession.find params[:id]
    @session.destroy!
    redirect_to training_sessions_path
  end

  private

    def session_params
      params.require(:training_session).permit :start_time, :trainer_id, :price
    end
end
