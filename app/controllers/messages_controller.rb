class MessagesController < ApplicationController

  def index
    @groups=Group.all
  end

  def create
  end

  def edit
  end

  def update
    @group = find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end
  
  def search
      @group = Group.find_by(name: params[:name])
  end

end
