class ApplicationController < ActionController::API
  acts_as_token_authentication_handler_for User, fallback: :none

  def is_login?
    unless current_user
      head(:unauthorized)
    end
  end
  
end
