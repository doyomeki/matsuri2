class Admin::ContentsController < Admin::AdminBaseController

  def create
    @event = Event.find(params[:event_id])
    @content = @event.contents.create(content_params)
    redirect_to admin_event_path(@event.id)
  end

  private
  def content_params
    params[:content].permit(:title, :description, :speaker_name, :speaker_profile)
  end
end
