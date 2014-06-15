class CreateUsersTasksJoinTable < ActiveRecord::Migration
  def change
  	create_join_table :users, :tasks
  end
end
