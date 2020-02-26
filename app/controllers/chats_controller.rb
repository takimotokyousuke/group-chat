class ChatsController < ApplicationController

  before_action :set_group,only:[:index,:create,:edit]

  def index
    @chat = Chat.new
    @chats = @group.chats.select("content")
    end

  def create
    #binding.pry
    @chat = @group.chats.new(chats_params)
    if @chat.save
      redirect_to group_chats_path(@group), notice: 'メッセージが送信されました'
    else
      @chats = @group.chats.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  def edit

  end
  

  private

  def chats_params
    params.require(:chat).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end