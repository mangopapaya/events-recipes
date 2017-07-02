class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Successfully updated"
      redirect_to edit_user_path
    else
      render "edit"
    end
  end

  def show
  end

  protected

  def find_user
    @user = current_user
    #如果没有User profile,先新建一个（如下代码）
    #unless @user.profile 等同于if !@user.profile 或 if @user.profile.nil?
    @user.create_profile unless @user.profile
  end

  def user_params
    params.require(:user).permit(:time_zone, :profile_attributes => [:id, :legal_name, :birthday, :location, :occupation, :education, :bio, :specialty])
  end

end
