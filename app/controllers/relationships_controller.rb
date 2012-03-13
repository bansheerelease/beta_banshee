class RelationshipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    @tag_name = ('follow_form'+@user.id.to_s+'f')
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    @tag_name = ('follow_form'+@user.id.to_s+'u')
    respond_to do |format|
      format.html { redirect_to @user }
      format.js {}
    end
  end
end
