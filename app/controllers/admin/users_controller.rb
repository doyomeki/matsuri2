class Admin::UsersController < Admin::AdminBaseController
  before_action :set_users, only: [:index]

  def index
  end

  def show
  end

  def edit
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

  private

  def set_users
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:nickname, :code, :admin)
  end
end
