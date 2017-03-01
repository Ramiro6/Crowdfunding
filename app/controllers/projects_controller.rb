class ProjectsController < ApplicationController
  before_action :authorize_user

  def avatar
    @img = Project.new
    @img.save
  end

  def home
    if current_user.nil?
      @name = "..."
    else
      @name = current_user.name
    end
    @img = Project.new
  end

  def new
    @img = Project.new

    if @img.save

    end
  end

  def create
    @img = Project.create(user_params)
  end

  private
  def user_params
    params.require(:project).permit(:avatar)
  end
end
