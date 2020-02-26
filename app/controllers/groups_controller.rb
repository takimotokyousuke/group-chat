class GroupsController < ApplicationController
  def index
    @group = Group.all
  end

  def new
    @group = Group.new
    
  end
  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to root_path
  end

  
  def update
    @group = find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end
    private
    def group_params
      params.require(:group).permit(:name, user_ids: [])
    end
  end