class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: current_user.id, chat_id: params[:chat_id])
    @likes = Like.where(chat_id: params[:chat_id])
    @chats = Chat.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, chat_id: params[:chat_id])
    like.destroy
    @likes = where(chat_id: params[:chat_id])
    @chats = Chat.all
  end
end
