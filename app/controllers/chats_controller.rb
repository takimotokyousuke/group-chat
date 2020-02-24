class ChatsController < ApplicationController
  before_action :set_group
  def index
    @chat = Chat.new
    @chats = @group.chats.includes(:user)
  end
  def create
    @chat = @group.chats.new(message_params)
    if @chats.save
      redirect_to group_chats_path(@group), notice: 'メッセージが送信されました'
    else
      @chats = @group.chats.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください'
    end
    end
    private 
    def chat_params
      params.require(:chat).permit(:content, :image).image(user_id: current_user.id)
    end
    def set_group
      @group = Group.find(params[:group_id])
    end
end
