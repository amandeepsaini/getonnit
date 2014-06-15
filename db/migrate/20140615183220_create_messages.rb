class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.text :body
      t.integer :project_id
      t.integer :component_id

      t.timestamps
    end
  end
end
