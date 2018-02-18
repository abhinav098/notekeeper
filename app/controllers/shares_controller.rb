class SharesController < ApplicationController
	before_action :set_share, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def index
    @shares = Share.all
  end
  
  def new
    @share = Share.new
  end

  def create
    @share = Share.new(share_params.merge(sharer_id: current_user.id))
    if @share.user != current_user
        @share.save
        redirect_to notes_path, notice: 'Note shared successfully'
    else
      render :new, notice: "Can't be shared with this user"  
    end
  end

  def update
    if @share.update(share_params)
      redirect_to notes_path, notice: 'Access was successfully updated.'
    else
      render :edit, note: "Access coudn't save"
    end
  end

  def destroy
    @share.destroy
    redirect_to notes_path, notice: 'Access was successfully revoked.'
  end

private
  def set_share
    @share = Share.find(params[:id])
  end

  def share_params
    params.require(:share).permit(:user_id, :sharer, :permissions, :shareable_id, :shareable_type, :note_id)
  end
end
