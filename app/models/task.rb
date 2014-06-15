class Task < ActiveRecord::Base
	has_and_belongs_to_many :users
	belongs_to :components
	before_save :default_values

	  has_attached_file :avatar,
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar,
    :content_type => /\Aimage\/.*\Z/

	def default_values
    	self.status ||= 'Incomplete'
 	 end
end
