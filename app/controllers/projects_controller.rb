class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    all_teams
    @project = Project.new
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
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)
    redirect_to(project)
  end

  private

  def all_teams
    @teams = Team.all
  end

  def project_params
    params.require(:project).permit(:name, :due_at, :status, :team_id)
  end
end
