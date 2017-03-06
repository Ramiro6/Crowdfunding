class ProjectsController < ApplicationController
  before_action :authorize_user

  def new
    if current_user.projects.last
      redirect_to "/config/#{current_user.projects.last.id}"
    else
      @config = Project.new
      # redirect_to "/config/new"
    end
    # @config = Project.new
  end

  def edit
    @config = current_user.projects.find(params[:project_id])
  end

  def home
    if current_user.nil?
      @name = "..."
    else
      @name = current_user.name
      @text = current_user.projects
    
    end
  end

  def update
    @config = current_user.projects.find(params[:id])
    if @config.update(user_params)
    end
  end

  def create
    @config = current_user.projects.create(user_params)
    redirect_to "/home"
  end

  private
  def user_params
    params.require(:project).permit(:avatar, :text)
  end
end
