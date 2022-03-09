# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: %i[project_manager tester developer]
  def index
    if current_user.has_role? :Developer
      redirect_to develop_path(current_user)
    elsif current_user.has_role? :Tester
      redirect_to tester_path(current_user)
    else
      redirect_to project_manager_path(current_user)
    end
  end

  def project_manager
    @projects = Project.all.where(user_id: current_user)
  end

  def tester
    @projects = Project.all
  end

  def developer
    @bugs = Bug.all.where(developer_id: current_user)
  end

  private

  def find_user
    @user = User.find_by_id(params[:id])
  end
end
