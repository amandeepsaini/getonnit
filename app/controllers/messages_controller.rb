class MessagesController < ApplicationController
  

  def create
  	@message= Message.new(message_params) 
  	@message.save 
  	redirect_to (:back) 
  end

  def delete

  end

	private
	def message_params
		params.require(:message).permit(:user_id, :body, :project_id, :component_id) 
	end 
end
