class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :deadline
      t.integer :component_id
      t.string :status

      t.timestamps
    end
  end
end
