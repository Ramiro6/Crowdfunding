class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :video
      t.string :texto
      t.string :img

      t.timestamps
    end
  end
end
