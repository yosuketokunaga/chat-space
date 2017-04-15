class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: 'チャットグループが作成されました。'
    else
      flash.now[:alert] = 'チャットグループの作成に失敗しました。'
      render new_group_path
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループが更新されました。'
    else
      flash.now[:alert] = 'グループの更新に失敗しました。'
      render edit_group_path
    end
  end

  def set_group
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name,{ user_ids:[]})
  end

end
