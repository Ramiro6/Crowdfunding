class AddProjectsToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :project, index:true
    add_reference :users, :post, index:true
  end
end
