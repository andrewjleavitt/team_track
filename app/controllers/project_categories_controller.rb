class ProjectCategoriesController < ApplicationController
  def index
    @project_categories = ProjectCategory.all
  end

  def new
    @project_category = ProjectCategory.new
  end

  def show
    @project_category = ProjectCategory.find(params["id"])
    @projects = @project_category.projects
  end

  def create
    project_category = ProjectCategory.create(project_category_params)
    flash.notice = "Created #{project_category.name}"
    redirect_to project_categories_path
  end

  private

  def project_category_params
    params.require(:project_category).permit(:name)
  end
end
