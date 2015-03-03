class HelpdeskActionsController < ApplicationController
  def create
    @helpdesk = Helpdesk.find(params[:helpdesk_id])
    @helpdesk_actions = @helpdesk.helpdesk_actions.build(params[:helpdesk_action])
    @helpdesk_actions.save

    redirect_to @helpdesk
  end

  def destroy
  end
end
