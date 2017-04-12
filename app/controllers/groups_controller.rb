class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: 'チャットグループが作成されました。'
    else
      render new_group_path, alert: 'チャットグループの作成に失敗しました。'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name,{ user_ids:[]})
  end
end
