class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_messages_path(@group), notice: 'チャットグループが作成されました。' }
        format.json
      else
        format.html { render :new }
        format.json
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_messages_path(@group), notice: 'グループが更新されました。' }
        format.json
      else
        format.html { render :edit }
        format.json
      end
    end
  end

  def set_group
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

end
