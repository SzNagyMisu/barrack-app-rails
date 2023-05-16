class TrainingSessionsController < ApplicationController
  def index
    @sessions = params.key?(:q) ? TrainingSession.search(params[:q]) : TrainingSession.default
    @sessions = @sessions.includes :trainer
    @q = params.fetch :q, {}
  end

  def register
  end

  def unregister
  end

  def join
  end

  private
    
    def search_params
      params.require(:q).permit :date_from, :date_to, :trainer
    end
end
