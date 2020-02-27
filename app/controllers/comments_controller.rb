class CommentsController < ApplicationController

  def create
    #binding.pry
    @comment = Comment.create(comment_params)
    redirect_to group_chats_path
  end
  


  private
  def comment_params
    params.require(:comment).permit(:content,:image).merge(user_id: current_user.id,chat_id: params[:chat_id] )
  end
end
