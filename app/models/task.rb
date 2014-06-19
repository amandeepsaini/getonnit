class Task < ActiveRecord::Base
	has_and_belongs_to_many :users
	belongs_to :component, :touch => true
	before_save :default_values

	# has_attached_file :avatar,
	# 	:styles => { :medium => "300x300>", :thumb => "100x100>" },
	# 	:default_url => "/images/:style/missing.png"

 #  	validates_attachment_content_type :avatar,
 #    	:content_type => /\Aimage\/.*\Z/ 

    has_attached_file :document, styles: {thumbnail: "60x60#"}

	do_not_validate_attachment_file_type :document
  	#validates_attachment_content_type :document, not: []  #content_type: ["application/pdf", /\Aimage\/.*\Z/, "application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document",  "text/plain"]

	def default_values
    	self.status ||= 'Incomplete'
 	end


 	def check_status
 		unless self.deadline == nil  			
			if self.deadline < Date.today && self.status == "Incomplete"
				self.status = "Overdue"
			end
		end
	 self.status 
	end


end



