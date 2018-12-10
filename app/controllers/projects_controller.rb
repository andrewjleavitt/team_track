class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    all_teams
    @project = Project.new
    @project_categories = ProjectCategory.all
  end

  def create
    project = Project.create(project_params)
    flash.notice = "Created #{project.name}"
    redirect_to projects_path
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    all_teams
    @project = Project.find(params[:id])
    @project_categories = ProjectCategory.all
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)
    redirect_to(project)
  end

  def finish
    project = Project.find(params[:id])
    project.complete
    redirect_to(project)
  end

  private

  def all_teams
    @teams = Team.all
  end

  def project_params
    params.require(:project).permit(:name, :start_at, :due_at, :status, :team_id, :complete_at, :project_category_id, :cost)
  end
end
