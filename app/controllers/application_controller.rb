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


  def populate_dashboard
    @user = @current_user

    @actions_done = @user.actions.select{ |u| u.is_done }.count
    @actions_notdone = @user.actions.select{ |u| !u.is_done }.count
    if @user.actions.count == 0
      @actions_notdone_percent= 0
    else
    @actions_notdone_percent = @actions_done * 100 / @user.actions.count
  end
    # @meetings_this_week = 'TODO'
    # @meetings_this_month = 'TODO'
    # @meetings_past = 'TODO'

    @meetings_this_week = @user.meetings.select{ |m| Date.parse(m.start.to_s).cweek == DateTime.now.cweek }.count

    @meetings_this_month =  @user.meetings.select{ |m| Date.parse(m.start.to_s).month == DateTime.now.month }.count

  end


end
