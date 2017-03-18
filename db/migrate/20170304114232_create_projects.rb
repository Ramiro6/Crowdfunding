class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :text
      t.string :maximum_amount
      t.string :accompanied
      t.string :project_name
      t.timestamps
    end
  end
end
