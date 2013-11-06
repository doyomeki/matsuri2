class Admin::ContentsController < Admin::AdminBaseController
  before_action :set_event, only: [:index, :show, :create, :edit, :update]
  before_action :set_content, only: [:update]

  def index
  end

  def show
  end

  def create
    @content = @event.contents.create(content_params)
    redirect_to admin_event_path(@event.id)
  end

  def new
  end

  def edit
  end

  def update
    @content.update(content_params)
    redirect_to admin_event_content_path(params[:event_id], params[:id])
#      if @content.update(content_params)
#        format.html { redirect_to admin_event_content_path(params[:event_id], params[:id]), notice: I18n.t('flash.update_event') }
#        format.json { head :no_content }
#      else
#        format.html { render action: 'edit', collection: @event, id: params[:id], event_id: params[:event_id] }
#        format.json { render json: @conatent.errors, status: :unprocessable_entity }
#      end
#    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_content
    @content = Content.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:title, :event_id, :booth_id, :description, :start_at, :finish_at, :speaker_name, :speaker_profile, :speaker_image)
  end
end
