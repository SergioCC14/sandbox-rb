class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :created_at
      t.integer :updated_at
      t.string :description
    end
  end
end
