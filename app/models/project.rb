class Project < ActiveRecord::Base
	has_and_belongs_to_many :users 
	has_many :components, dependent: :destroy
	has_many :messages

	def check_status 
		self.status = "On Track" 
		complete = true
		empty = true
		if self.components.size == 0 
			self.status = "Empty"
			complete = false 
		end 
		self.components.each do |component| 
			if component.check_status == "Off Track"
				self.status = "Off Track"
				complete = false
				empty = false
				break
			end
			if component.check_status == "On Track"
				complete = false
				empty = false			
			end
			if component.check_status == "Complete"
				empty = false
			end
		end 
		if complete
			self.status = "Complete"
		end
		if empty
			self.status = "Empty"
		end 

	 self.status 


	end
end
