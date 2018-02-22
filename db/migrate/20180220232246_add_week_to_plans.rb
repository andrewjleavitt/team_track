class AddWeekToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :week, :date
  end
end
