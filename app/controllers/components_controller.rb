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
    @component = Component.find(params[:component][:component_id])
    @user = User.find(params[:component][:user_id])

    if @component.users.include?(@user)
      redirect_to @component,
      alert: "User already In"
    else 
      @component.users << @user
      redirect_to @component
    end
  end

  def edit
  end

  def destroy
    Component.find(params[:id]).destroy
    redirect_to (:back)
  end

  def show
    @component = Component.find(params[:id])
    @name = @component.name
    @tasks = @component.tasks
    @task = Task.new
    @available_users = @component.project.users
    @search = @component.project.users.search(params[:q])
    @search.result
  end

  private
    def component_params
      params.require(:component).permit(:name, :description, :deadline, :project_id)
    end
end
