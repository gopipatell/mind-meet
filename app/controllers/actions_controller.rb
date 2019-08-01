class ActionsController < ApplicationController

  def create
    check_for_login
    @meeting = Meeting.find params[:meeting_id]
    check_for_authorisation_participants @meeting

    @action = @meeting.actions.create action_params
    @action.is_done = false
    @action.user = @current_user
    @action.save

    redirect_to meeting_path(@meeting)
  end

  def destroy
    check_for_login
    meeting = Meeting.find params[:meeting_id]
    action = Action.find params[:id]

    if @current_user == action.user || @current_user == meeting.host
      action.delete
      redirect_to request.referer
    else
      redirect_to error_unauthorised_path
    end
  end

  def complete
    check_for_login
    action = Action.find params[:id]
    if action.user == @current_user || action.meeting.host == @current_user
      action.is_done = !action.is_done
      action.save
      redirect_to request.referer
    else
        redirect_to error_unauthorised_path
    end
  end

  private
  def action_params
    #require[:action] is not working since Ruby params has action=create. Hence renaming the model with form_for(, :as => :meeting_action)
    params.require(:meeting_action).permit(:description, :duedate)
  end
end
