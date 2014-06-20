class Component < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :tasks, dependent: :destroy	
	belongs_to :project, :touch => true	

	def check_status
		complete = true	
		self.status = "On Track"
		if self.tasks.size == 0
			self.status = "No Tasks"
			complete = false
		end
		self.tasks.each do |task|
			if task.check_status == "Overdue"
				self.status = "Off Track"
				complete = false
			end
			if task.check_status == "Incomplete"
				complete = false
			end
		end
		if complete
			self.status = "Complete"
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

		progress[:overdue_tasks_ratio] = (overdue_tasks.size.to_f/total_tasks)*100

		progress[:completed_ratio] = (total_completed_tasks.to_f/total_tasks)*100
		return progress

	end

end
