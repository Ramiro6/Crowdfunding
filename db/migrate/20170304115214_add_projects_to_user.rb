class AddProjectsToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :project, index:true
  end
end
