class AddProjectIdToPlan < ActiveRecord::Migration[5.1]
  def change
    add_reference :plans, :project, foreign_key: true
    Plan.all.each do |plan|
      project = Project.find_by(name: plan.project)
      plan.update_attributes(project_id: project.id) unless project.nil?
    end
  end
end
