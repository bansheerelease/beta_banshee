class UserInfosController < ApplicationController

  before_filter :authenticate_user!

  # GET /user_infos/1
  # GET /user_infos/1.json
  def show
    @title = 'User profile'
    @user_info = current_user.user_info
    if @user_info.nil?
      current_user.user_info = UserInfo.new()
      @user_info = current_user.user_info
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_info }
    end
  end

  # GET /user_infos/new
  # GET /user_infos/new.json
  def new
    @title = 'User profile'
    @user_info = UserInfo.new
    redirect_to '/'
  end

  # GET /user_infos/1/edit
  def edit
    @title = 'User profile'
    @user_info = UserInfo.find(params[:id])
  end

  # POST /user_infos
  # POST /user_infos.json
  def create
    @title = 'User profile'
    @user_info = UserInfo.new(params[:user_info])

    respond_to do |format|
      if @user_info.save
        format.html { redirect_to @user_info, notice: 'User info was successfully created.' }
        format.json { render json: @user_info, status: :created, location: @user_info }
      else
        format.html { render action: "new" }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_infos/1
  # PUT /user_infos/1.json
  def update
    @title = 'User profile'
    @user_info = UserInfo.find(params[:id])

    respond_to do |format|
      if @user_info.update_attributes(params[:user_info])
        format.html { redirect_to @user_info, notice: 'User info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_infos/1
  # DELETE /user_infos/1.json
  def destroy
    @title = 'User profile'
    @user_info = UserInfo.find(params[:id])
    @user_info.destroy

    respond_to do |format|
      format.html { redirect_to user_infos_url }
      format.json { head :no_content }
    end
  end
end

