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
    check_for_authorisation @meeting
  end

  def edit
    check_for_login
    @meeting = Meeting.find params[:id]
    check_for_authorisation @meeting
  end

  def update
    check_for_login
    meeting = Meeting.find params[:id]
    check_for_authorisation meeting
    meeting.update meeting_params
    redirect_to meeting_path(meeting)
  end

  def delete
    check_for_login
    meeting = Meeting.find params[:id]
    check_for_authorisation meeting
    meeting.delete
    redirect_to dashboard_path	
  end

  private
  def meeting_params
    params.require(:meeting).permit(:title, :agenda1,:agenda2, :agenda3, :duration)
  end

  private
  def check_for_authorisation(meeting)
    # Show meeting only to host
    redirect_to '/error/unauthorised' unless meeting.host == @current_user
    # Show meeting only to the participants
  end

end
