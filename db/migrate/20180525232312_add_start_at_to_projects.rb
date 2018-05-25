class AddStartAtToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :start_at, :date
  end
end
