class CreateUsersComponentsJoinTable < ActiveRecord::Migration
	create_join_table :users, :components
  def change
  end
end
