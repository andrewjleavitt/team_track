class AddProjectCategoryToProject < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :project_category, foreign_key: true
  end
end
