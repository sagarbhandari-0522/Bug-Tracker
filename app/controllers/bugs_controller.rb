class BugsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, only: %i[index create edit update destroy]
  before_action :find_bug, only: %i[edit update destroy]

  def index
    @user = User.find_by_id(@project.user_id)
    @bug = Bug.new
  end

  def create
    @bug = @project.bugs.new(bug_params)
    @bug.tester_id = current_user.id
    @bug.manager_id = @project.user_id
    if @bug.save
      puts '*' * 50
      redirect_to project_bugs_path(@project)
    else
      render 'bugs/index'
    end
  end

  def edit
    @user = User.find_by_id(@project.user_id)
    render 'bugs/index'
  end

  def update
    @bug.tester_id = current_user.id
    if @bug.update(bug_params)
      redirect_to project_bugs_path(@project)
    else
      render 'bugs/index'
    end
  end

  def destroy
    @bug.destroy
    redirect_to project_bugs_path(@project)
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :body, :status)
  end

  def find_project
    @project = Project.find_by_id(params[:project_id])
  end

  def find_bug
    @bug = Bug.find_by_id(params[:id])
  end
end
