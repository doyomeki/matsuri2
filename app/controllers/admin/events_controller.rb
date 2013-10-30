class Admin::EventsController < Admin::AdminBaseController
  before_action :set_events, only: [:index, :set_upcoming]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_events_path, notice: I18n.t('flash.create_event') }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to admin_events_path, notice: I18n.t('flash.update_event') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     @event.destroy
      respond_to do |format|
         format.html { redirect_to admin_events_path, notice: I18n.t('flash.destroy_event') }
         format.json { head :no_content }
     end
  end

  def set_upcoming
    Event.transaction do
      target_event = Event.find(upcoming_id_param.to_i)
      @events.each do |event|
        event.upcoming = false
        event.save
      end
      target_event.upcoming = true
      target_event.save
    end
    redirect_to admin_events_path
  end

  private

  def set_events
    @events = Event.all
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :capacity, :place, :start_at, :finish_at, :deleted_at)
  end

  def upcoming_id_param
    params.require(:id)
  end
end
