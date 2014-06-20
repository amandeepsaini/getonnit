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
      #UserMailer.registration_confirmation(current_user).deliver

      #add else statement later with alert/notice
    end
    redirect_to @project


  end

  def update
    email = params[:email]
    @user = User.where(:email => email)

    @project = Project.find(params[:id])
    if @project.users.include?(@user)
      redirect_to @project,
      alert: "User already In"
    else
      @project.users << @user
      @project.save
    end

    #redirect_to :action => 'show', :id => @project.id
    redirect_to @project
  end


  def invite_user
    name = params[:name]
    email = params[:email]
    sender = User.find(params[:sender_id])
    UserMailer.invite_user(email, name, sender).deliver

    redirect_to root_path
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
