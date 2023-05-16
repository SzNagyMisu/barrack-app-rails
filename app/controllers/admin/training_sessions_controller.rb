class Admin::TrainingSessionsController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'admin'

  def index
    @sessions = TrainingSession.default
  end
end
