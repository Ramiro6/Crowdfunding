class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :text
      t.string :maximum_amount
      t.timestamps
    end
  end
end
