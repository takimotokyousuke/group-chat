class MessagesController < ApplicationController
  def index
    @groups=Group.all
  end
  def create
  end
  def search
      @group = Group.find_by(name: params[:name])
  end

end
