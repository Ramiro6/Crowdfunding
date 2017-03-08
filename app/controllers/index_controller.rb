class IndexController < ApplicationController
  before_action :authorize_user, :except => [:index]

  def index
    @text = User.find(1)
    @entry = @text.projects
  end

end
