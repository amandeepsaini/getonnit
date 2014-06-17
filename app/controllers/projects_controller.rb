class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @search = current_user.projects.search(params[:q])
    @projects = @search.result
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      current_user.projects << @project

      #add else statement later with alert/notice
    end
    redirect_to @project


  end

  def update
    #multiple emails can be added at once
    emails = params[:emails].split(",").map(&:strip)
    @users = User.where(:email => emails)

    @project = Project.find(params[:id])
    @project.users << @users

    #redirect_to :action => 'show', :id => @project.id
    redirect_to @project
  end

  def edit
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to root_path
  end

  def show  
    @project = Project.find(params[:id])
    @name = @project.name
    @components = @project.components
    @component = Component.new
    @messages = @project.messages
    @message = Message.new
  end

  private
    def project_params
      params.require(:user).permit(:name, :email)
    end
    def project_params
      params.require(:project).permit(:name, :description, :deadline, :user_id)
    end

end
