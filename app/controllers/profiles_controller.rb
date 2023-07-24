class ProfilesController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params.merge(username: current_user.name, age: current_user.age, phone_number: current_user.phone_number, email: current_user.email))
    if @profile.save 
      redirect_to user_posts_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show_followers
    @profile = Profile.find(params[:id])
    # @followers = @profile.user.all_follows
    @followers = @profile.user.followers
  end

  def show_followings
    @profile = Profile.find(params[:id])
    @followings = @profile.user.all_following
  end

  def search
    byebug
    @searched = User.find_by(name: params[:user_name])
    if @searched != nil
      redirect_to user_profile_path(@searched.id, @searched.profile.id)
    else
      render :new, status: :unprocessable_entity
    end
  end 

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def profile_params
    params.require(:profile).permit(:username, :age, :phone_number, :email, :profile_pic)
  end
end