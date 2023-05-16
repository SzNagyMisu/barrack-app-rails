module WithLoggedInUser
  extend ActiveSupport::Concern

  included do
    before_action do
      if current_user.nil?
        flash[:notice] = 'You must be logged in.'
        redirect_to new_user_session_path
      end
    end
  end
end
