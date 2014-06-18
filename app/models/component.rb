class Component < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :tasks, dependent: :destroy	
	belongs_to :project, :touch => true	

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

	def check_progress 
		progress = {}

		total_tasks = self.tasks.size
		total_completed_tasks = self.tasks.where(:status => "Complete").size

		overdue_tasks = []
		self.tasks.each do |task|
			unless task.deadline == nil
				# if task.deadline >= Date.today
				# 	due_tasks << task
				if task.deadline < Date.today && task.status == "Incomplete"
					overdue_tasks << task
					#if task.status == "Incomplete" 1 day before deadline 
					# self.tasks.each do |task|
					# 	date_difference = (task.deadline - Date.today).to_i  
					# 	unless date_difference != 1 | task.deadline == nil | task.status == "Complete"  
					# 		if task.status == "Incomplete" && date_difference == 1  
					# 			# send email 
					# 			UserMailer.registration_confirmation(current_user).deliver
					# 		end 
					# 	end
					# end
				end
			end
		end

		progress[:overdue_tasks_ratio] = (overdue_tasks.size.to_f/total_tasks)

		progress[:completed_ratio] = (total_completed_tasks.to_f/total_tasks) 
		return progress

	end

end
