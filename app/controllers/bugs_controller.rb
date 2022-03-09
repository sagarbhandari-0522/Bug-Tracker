class BugsController < ApplicationController
  def index
    @project = Project.find_by_id(params[:project_id])
    @user = User.find_by_id(@project.user_id)
    @bug = Bug.new
  end

  def create
    @project = Project.find_by_id(params[:project_id])
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
    @project = Project.find_by_id(params[:project_id])
    @user = User.find_by_id(@project.user_id)
    @bug = Bug.find_by_id(params[:id])
    render 'bugs/index'
  end

  def update
    byebug
    @project = Project.find_by_id(params[:project_id])
    @bug = Bug.find_by_id(params[:id])
    @bug.tester_id = current_user.id
    if @bug.update(bug_params)
      redirect_to project_bugs_path(@project)
    else
      render 'bugs/index'
    end
  end

  def destroy
    @project = Project.find_by_id(params[:project_id])
    @bug = Bug.find_by_id(params[:id])
    @bug.destroy
    redirect_to project_bugs_path(@project)
  end

  def bug_params
    params.require(:bug).permit(:title, :body, :status)
  end
end
