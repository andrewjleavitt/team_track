class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.references :team, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
