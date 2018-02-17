class SharesController < ApplicationController
	before_action :find_shareable

  def new
    @shareable = Shareable.new
  end

  def create
    @share = @shareable.shares.new(share_params)
    if @share.user && (current_user != @share.user)
      @share.save
      redirect_to :back, notice: 'Your note was successfully shared!'
    else
      redirect_to :back, notice: "Cant be shared with this user" 
    end
  end

  def destroy
    if @shareable.destroy
      redirect_to :back, flash[:success] = "Removed Access successfully"
    end
  end

  private

  def share_params
    params.require(:share).permit(:user_id, :permission)
  end

  def find_shareable
    @shareable = Share.find_by_id(params[:share_id]) if params[:share_id]
    @shareable = Note.find_by_id(params[:note_id]) if params[:note_id]
  end
end
