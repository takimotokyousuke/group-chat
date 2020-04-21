class CommentsController < ApplicationController

  def create
    @chat = Chat.find(params[:chat_id])
    @comment = Comment.create(comment_params)
    redirect_to "/groups/#{@chat.group_id}/chats/#{@chat.id}"
  end
  


  private
  def comment_params
    params.require(:comment).permit(:content,:image).merge(user_id: current_user.id,chat_id: params[:chat_id] )
  end
end
