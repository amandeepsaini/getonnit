class CreateUsersProjectsJoinTable < ActiveRecord::Migration
	create_join_table :users, :projects
  def change
  end
end
