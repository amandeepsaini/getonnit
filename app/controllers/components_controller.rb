class ComponentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @component = Component.new(component_params)

    # @project = Project.find([id])
    # @component.project = @project
   #if 
   
    @component.save
    
    redirect_to(:back)

    #render_action: @project.find[id] 

    #end 
      #add else


    #end

    #@project.components << @component
  end

  def update
  end

  def edit
  end

  def delete
  end

  def show
    @component = Component.find(params[:id])
    @name = @component.name
    @tasks = @component.tasks
    @task = Task.new
  end

  private
    def component_params
      params.require(:component).permit(:name, :description, :deadline, :project_id)
    end
end
