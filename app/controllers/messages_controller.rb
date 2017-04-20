class MessagesController < ApplicationController

  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages.includes(:user)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: 'メッセージが送信されました。'
    else
      redirect_to group_messages_path, alert: 'メッセージが送信されませんでした。'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
