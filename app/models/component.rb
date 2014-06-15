class Component < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :tasks, dependent: :destroy
	belongs_to :projects

	def check_status	
		 self.status = "Complete"
		 if self.tasks.size == 0
			 self.status = "No Tasks"
		 end
		 self.tasks.each do |task|
			 if task.status == "Incomplete"
				 self.status = "Incomplete"
			 end
		 end
		 self.status 

	end
end
