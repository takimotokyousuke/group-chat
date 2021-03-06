class GroupsController < ApplicationController
  before_action except:[:index]
  def index
    @users = User.all
    @group = Group.find(params[:id])
    
  end

  def new
    @group = Group.new
    
  end
  def create
    @group = Group.new
    @group = Group.create(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to root_path(@group)
  end

  def update
    @group = Group.find(params[:id])
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