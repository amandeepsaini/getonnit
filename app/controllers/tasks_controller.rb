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
    @task.update_attributes(task_params)
    @task.save
    redirect_to (:back)
  end

  def edit
  end

  def delete
  end

  def show
  end
    private
    def task_params
      params.require(:task).permit(:name, :description, :deadline, :component_id, :avatar, :status)
    end
end
