class ProjectsController < ApplicationController
  before_action :find_project, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      @project.save
      redirect_to project_path(@project)
    else
      render new
    end
  end

  def edit
    render 'edit'
  end

  def update
    @project.user_id = current_user.id
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to project_manager_path(current_user)
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def find_project
    @project = Project.find_by_id(params[:id])
  end
end
