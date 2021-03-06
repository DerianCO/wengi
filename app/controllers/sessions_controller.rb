class SessionsController < ApplicationController
  before_action :getUser

  def create
    if @user&.valid_password?(params[:password])
      render json: @user.as_json(only: [:email,:authentication_token])
    else
      head(:unauthorized)
    end
  end

  def destroy
    current_user.authentication_token = nil
    if current_user.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end

  private

  def getUser
    @user = User.where(email: params[:email]).first
  end
end
