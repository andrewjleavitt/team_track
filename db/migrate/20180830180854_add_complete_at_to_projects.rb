class AddCompleteAtToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :complete_at, :date, null: true, default: nil
  end
end
