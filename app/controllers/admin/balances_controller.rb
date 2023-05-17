class Admin::BalancesController < ApplicationController
  def edit
    @balance = current_user.balance || current_user.create_balance!
  end

  def update
    @balance = current_user.balance
    @balance.add! params.require(:balance)[:plus_amount].to_i
    redirect_to admin_user_path(current_user)
  rescue ActiveRecord::RecordInvalid
    @balance.reload
    render :edit, status: :unprocessable_entity
  end
end
