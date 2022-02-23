class DevelopersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_bug, only: %i[create edit]
  def create
    @bug.update_attribute(:status, params[:status])
    redirect_to develop_path(current_user)
  end

  def edit; end

  private

  def find_bug
    @bug = Bug.find_by_id(params[:id])
  end
end
