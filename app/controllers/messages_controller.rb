class MessagesController < ApplicationController

  before_action :set_message, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
       format.html { redirect_to group_messages_path, notice: "メッセージが送信されました"}
       format.json
      end
    else
      flash.now[:alert] = 'メッセージの送信に失敗しました。'
      render :index
    end
  end

  def set_message
    @group = Group.find(params[:group_id])
    @messages = @group.messages.includes(:user)
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
