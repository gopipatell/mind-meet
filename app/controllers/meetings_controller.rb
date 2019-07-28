class MeetingsController < ApplicationController
  before_action :check_for_login

  def new
    check_for_login
    @meeting = Meeting.new
  end

  def create
    check_for_login
    @meeting = Meeting.create meeting_params
    @meeting.host = @current_user
    if @meeting.save
      @current_user.hostedMeetings << @meeting
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    check_for_login
    @meeting = Meeting.find params[:id]
    check_for_authorisation_participants @meeting
  end

  def edit
    check_for_login
    @meeting = Meeting.find params[:id]
    check_for_authorisation_host @meeting
  end

  def update
    check_for_login
    meeting = Meeting.find params[:id]
    check_for_authorisation meeting
    meeting.update meeting_params
    redirect_to check_for_authorisation_host(meeting)
  end

  def delete
    check_for_login
    meeting = Meeting.find params[:id]
    if check_for_authorisation_host(meeting) &&
    meeting.delete
      redirect_to dashboard_path
    end
  end

  private
  def meeting_params
    params.require(:meeting).permit(:title, :agenda1,:agenda2, :agenda3, :duration)
  end

  def check_for_authorisation_host(meeting)
    # Show meeting only to host and participants
    redirect_to '/error/unauthorised' and return false unless meeting.host == @current_user
    return true
  end

  def check_for_authorisation_participants(meeting)
    # Show meeting only to host and participants
    redirect_to '/error/unauthorised' and return false unless meeting.host == @current_user ||
    meeting.users.include?(@current_user)
    return true
  end

end
