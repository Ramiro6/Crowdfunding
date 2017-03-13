class IndexController < ApplicationController
  before_action :authorize_user, :except => [:index]

  def index
    if current_user.nil?
      @name = "Register/Login"
    else
      @name = current_user.name
    end
    @text = User.find(1)
    @entry = @text.projects
  end

end
