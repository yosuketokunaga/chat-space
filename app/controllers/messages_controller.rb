class MessagesController < ApplicationController

  before_action :set_group,:set_messages, only: [:index, :create]

  def index
    @message = Message.new

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @group.messages.includes(:user).map(&:to_api_json) }
    end
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'}
        format.json
      end
    else
      flash.now.alert = 'メッセージを入力して下さい'
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_messages
    @messages = @group.messages.includes(:user)
  end

end
