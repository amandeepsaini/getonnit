class AddDocumentToTasks < ActiveRecord::Migration
  def change
  	add_attachment :tasks, :document
  end
end
