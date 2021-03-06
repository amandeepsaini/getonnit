class User < ActiveRecord::Base
	has_and_belongs_to_many :projects
	has_and_belongs_to_many :components
	has_and_belongs_to_many :tasks 
	has_many :messages
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
