class ProjectsController < ApplicationController
  before_action :authorize_user

  def avatar
    @config = Project.new
  end

  def home
    if current_user.nil?
      @name = "..."
    else
      @name = current_user.name
      @text = current_user.projects
    end
    @config = Project.new
  end

  def create
    @config = current_user.projects.create(user_params)
    redirect_to "/home"
  end

  private
  def user_params
    params.require(:project).permit(:text)
  end
end
