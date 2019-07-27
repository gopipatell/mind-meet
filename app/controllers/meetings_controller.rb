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

  def edit
  end

  def delete
  end

  private
  def meeting_params
    params.require(:meeting).permit(:title, :agenda1,:agenda2, :agenda3, :duration)
  end
end
