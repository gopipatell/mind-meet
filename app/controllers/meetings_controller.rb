class MeetingsController < ApplicationController
  before_action :check_for_login

  def new
    check_for_login
    @meeting = Meeting.new
    @participants = User.all.select{ |u| @current_user != u }
  end

  def create
    check_for_login
    @meeting = Meeting.create meeting_params
    @participants = User.all.select{ |u| @current_user != u }

    @meeting.host = @current_user
    if @meeting.save
      @current_user.hostedMeetings << @meeting
      @current_user.meetings << @meeting
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    check_for_login
    @meeting = Meeting.find params[:id]
    check_for_authorisation_participants @meeting
    populate_dashboard
  end

  def edit
    check_for_login
    @meeting = Meeting.find params[:id]
    @participants = User.all.select{ |u| @current_user != u }

    check_for_authorisation_host @meeting
  end

  def update
    check_for_login
    @meeting = Meeting.find params[:id]
    @participants = User.all.select{ |u| @current_user != u }
    check_for_authorisation_host @meeting

    if @meeting.update meeting_params
      @current_user.meetings << @meeting
      redirect_to meeting_path(@meeting)
    else
      render :edit
    end
  end

  def destroy
    check_for_login
    meeting = Meeting.find params[:id]
    if check_for_authorisation_host(meeting) &&
    meeting.delete
      redirect_to dashboard_path
    end
  end

  private
  def meeting_params
    params.require(:meeting).permit(:title, :agenda1,:agenda2, :agenda3, :start, :duration,user_ids:[])
  end

  def check_for_authorisation_host(meeting)
    # Show meeting only to host and participants
    redirect_to '/error/unauthorised' and return false unless meeting.host == @current_user
    return true
  end


end
