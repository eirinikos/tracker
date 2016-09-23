class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :name
      t.string :description
      t.integer :state
      t.uuid :project_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
