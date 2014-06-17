class Project < ActiveRecord::Base
	has_and_belongs_to_many :users 
	has_many :components, dependent: :destroy
	has_many :messages

	def check_status 
		self.status = "Complete" 
		if self.components.size == 0 
			self.status = "Empty Project" 
		end 
		self.components.each do |component| 
			if component.check_status == "Incomplete"
				self.status = "Incomplete"  			
			end 
		end 

	 self.status 


	end
end
