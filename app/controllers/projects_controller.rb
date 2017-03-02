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
    end
    @config = Project.new
  end

  def new
    @config = Project.new
  end

  def create
    @config = Project.create(user_params)
    if @config.save
    end
  end

  private
  def user_params
    params.require(:project).permit(:avatar, :texto)
  end
end
