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
    @amount = Project.last.maximum_amount
    @deposit = params[:payment]
    @new = Project.last
    @new.accompanied = @deposit
    if @new.save
    end

    # params[:amount] params[:project_id]
    #
    # project = Project.find(params[:project_id])
    # name = project.name

    # @payment = current_user.projects.maximum_amount
    # @payment = Project.new params['subcomment']
    # if @payment.save
    #   render :json => { message: "bla" } # send back any data if necessary
    # else
    #   render :json => { name: name }, :status => 500
    # end
  end

  def explore
    @home = User.find(params[:project_id])
    @text = Project.find(params[:project_id])
    @post = @home.posts
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
      @deposit = Project.find(2)
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
    params.require(:project).permit(:avatar, :text, :maximum_amount, :accompanied)
  end
end
