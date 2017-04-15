class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: 'チャットグループが作成されました。'
    else
      flash.now[:alert] = 'チャットグループの作成に失敗しました。'
      render new_group_path
    end
  end

  private
  
  def group_params
    params.require(:group).permit(:name,{ user_ids:[]})
  end
end
