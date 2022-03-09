class DevelopersController < ApplicationController
  def create
    @bug = Bug.find_by_id(params[:id])
    @bug.update_attribute(:status, params[:status])
    redirect_to develop_path(current_user)
  end

  def edit
    @bug = Bug.find_by_id(params[:id])
  end
end
