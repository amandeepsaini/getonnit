class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.text :description
      t.date :deadline
      t.integer :project_id
      t.string :status

      t.timestamps
    end
  end
end
