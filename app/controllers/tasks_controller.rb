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

    @task = Task.find(params[:id])
    if params[:task][:document] == "delete_attachment"
      @task.document = nil
    else
      @task.update_attributes(task_params)
    end
    @task.save
    redirect_to (:back)
  end

  def add_users
        @tasks = Task.find(params[:id])
        @user = User.find(params[:id])

    if @task.users.include?(@user)
      redirect_to @task,
      alert: "User already In"
    else 
      @task.users << @user
    end 
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
        :component_id, :document, :status)
    end
end
