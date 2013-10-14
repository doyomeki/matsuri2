class Admin::AdminBaseController < ApplicationController
  before_action :admin_required

  private
  def admin_required
    redirect_to root_path unless current_user.admin
  end
end
