# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.has_role? :developer
      redirect_to developer_path(current_user)
    elsif current_user.has_role? :tester
      redirect_to tester_path(current_user)
    else
      redirect_to project_manager_path(current_user)
    end
  end

  def project_manager
    @user = User.find_by_id(params[:id])
  end

  def tester
    @user = User.find_by_id(params[:id])
  end

  def developer
    @user = User.find_by_id(params[:id])
  end
end
