class Admin::UsersController < Admin::AdminBaseController
  before_action :set_users, only: [:index]
  before_action :set_user, only: [:edit, :update]

  def index
  end

  def show
  end

  def edit
  end

  def update

    respond_to do |format|
      if @user.update_without_current_password(user_params)
        format.html { redirect_to admin_users_path, notice: I18n.t('flash.update_user') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_users
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:code, :nickname, :admin, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
