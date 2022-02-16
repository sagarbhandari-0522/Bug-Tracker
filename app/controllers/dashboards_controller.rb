# frozen_string_literal: true

class DashboardsController < ApplicationController
  def index
    # redirect_to dashboard_path(current_user) if user_signed_in?
  end

  def show
    @user = User.find_by_id(params[:id])
  end
end
