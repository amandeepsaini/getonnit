class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = current_user.projects
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      current_user.projects << @project

      #add else statement later with alert/notice
    end
    redirect_to root_path


  end

  def new
    @project = Project.new
  end

  def update
    emails = params[:emails].split(",").map(&:strip)
    @users = User.where(:email => emails)

    @project = Project.find(params[:id])
    @project.users << @users

    #redirect_to :action => 'show', :id => @project.id
    redirect_to @project
  end

  def edit
  end

  def delete
  end

  def show  
    @project = Project.find(params[:id])
    @name = @project.name
    @components = @project.components
    @component = Component.new
  end

  private
    def project_params
      params.require(:user).permit(:name, :email)
    end
    def project_params
      params.require(:project).permit(:name, :description, :deadline, :user_id)
    end

end
