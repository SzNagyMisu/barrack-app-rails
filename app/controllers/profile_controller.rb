class ProfileController < ApplicationController
  include WithLoggedInUser

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    @profile.update! profile_params
    redirect_to profile_path
  rescue ActiveRecord::RecordInvalid
    render :edit, status: :unprocessable_entity
  end

  private

    def profile_params
      params.require(:profile).permit :name, :date_of_birth, :gender, :height_in_cm, :weight_in_kg, :phone
    end
end
