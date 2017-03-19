class ProjectsController < ApplicationController
  before_action :authorize_user, :except => [:explore]

  def new
    if current_user.projects.last
      redirect_to "/config/#{current_user.projects.last.id}"
    else
      @config = Project.new
      # redirect_to "/config/new"
    end
    # @config = Project.new
  end


  def payment
    @deposit = params[:send_java]
    @java = params[:send_java]
    @rails = Project.last.accompanied
    @total_var = Project.last
    @total_var.accompanied = @java.to_i + @rails.to_i
    @total_var.save

    # if @new = Project.last.nil?
    #
    # else
    #   @java = params[:send_java]
    #   @rails = Project.find(params[:project_id]).accompanied
    #   @total_var = Project.find(params[:project_id])
    #   @total_var.accompanied = @java.to_i + @rails.to_i
    #   @total_var.save
    # end
  end


  def explore
    @home = User.find(params[:project_id])
    @text = Project.find(params[:project_id])
    @post = @home.posts

    @java = params[:send_java].to_i

    @rails = Project.find(params[:project_id]).accompanied.to_i
    @total_var = Project.find(params[:project_id])
    @total_var.accompanied = @java + @rails
    @total_var.accompanied.to_s
    @total_var.save
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
      @post = current_user.posts
    end
  end

  def update
    @config = current_user.projects.find(params[:id])
    if @config.update(user_params)
    end
  end

  def create
    @config = current_user.projects.create(user_params)
    if @config.save
      redirect_to "/home"
    end
  end

  private
  def user_params
    params.require(:project).permit(:avatar, :text, :maximum_amount, :accompanied, :project_name)
  end
end
