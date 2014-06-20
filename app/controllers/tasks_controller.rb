class TasksController < ApplicationController
  def index
  end

  def new
  end



  def create
    @task = Task.new(task_params)
    @task.save
    
    redirect_to(:back)
  end

  def update

    @task = Task.find(params[:task][:task_id])
    if params[:task][:document] == "delete_attachment"
      @task.document = nil
    elsif params[:task][:user_id] != nil
      @user = User.find(params[:task][:user_id])
      if @task.users.include?(@user)
        redirect_to @task.component,
        alert: "User already In"
      else
        @task.users << @user
        unless @task.component.users.include?(@user)
          @task.component.users << @user
        end
      end
    else
      @task.update_attributes(task_params)
    end
    @task.save
    redirect_to (:back)
  end


  def edit
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to (:back)
  end

  def show


  end
    private
    def task_params
      params.require(:task).permit(:name, :description, :deadline,
        :component_id, :document, :status, :user_id)
    end
end
