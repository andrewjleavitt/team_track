class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.create(project_params)
    flash.notice = "Created #{project.name}"
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :status)
  end
end