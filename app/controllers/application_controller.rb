class ApplicationController < ActionController::Base
  before_action :fetch_user


  private
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  def check_for_login
    redirect_to login_path unless @current_user.present?
  end

  def check_for_authorisation_participants(meeting)
    # Show meeting only to host and participants
    redirect_to error_unauthorised_path and return false unless meeting.host == @current_user ||
    meeting.users.include?(@current_user)
    return true
  end

end
