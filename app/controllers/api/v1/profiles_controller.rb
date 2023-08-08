class Api::V1::ProfilesController < ApplicationController
  
  # load_and_authorize_resource

  def index
  end

  def show
    if current_user.confirm_by_admin == false
      render json: { error: "Confirm account first" }, status: 400
    else
      user = User.find(params[:user_id]) 
      @profile = user.profile
      render json: @profile
    end
  end

  def new
    if current_user.confirm_by_admin == false
      render partial: 'layouts/confirm_first'
    else
      @profile = current_user.build_profile
    end
  end

  def create
    if current_user.confirm_by_admin == false
      render partial: 'layouts/confirm_first'
    else
      @profile = current_user.build_profile(profile_params.merge(username: current_user.name, age: current_user.age, phone_number: current_user.phone_number, email: current_user.email))
      if @profile.save 
        redirect_to user_posts_path(current_user)
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def approv_accounts
    if current_user.role == "Admin"
      @users = User.where(confirm_by_admin: false)
    end
  end

  def confirm_approve
    @user = User.find(params[:user_id])
    @user.update(confirm_by_admin: true)
    MyMailer.approval_notification(@user).deliver_now
    redirect_to approve_path,  notice: 'Email sent successfull. User has been approved.'
    render json: { message: "Successfully confirmed user" }, status: 200
  end  

  def show_followers
    if current_user.confirm_by_admin == false
      render partial: 'layouts/confirm_first'
    else
      profile = Profile.find(params[:id])
      # @followers = @profile.user.all_follows
      @followers = profile.user.followers
      render json: @followers
    end
  end

  def show_followings
    if current_user.confirm_by_admin == false
      render partial: 'layouts/confirm_first'
    else
      @profile = Profile.find(params[:id])
      @followings = @profile.user.all_following
      render json: @followings
    end
  end

  def search
    # byebug
    # @searched = User.find_by(name: params[:user_name])
    @searched = User.where("users.name LIKE ?", "%" + params[:user_name] + "%")
    # if @searched != nil
      redirect_to user_profile_path(@searched.id, @searched.profile.id)
    # else
    #   render :new, status: :unprocessable_entity
    # end

    # @u = User.ransack(params[:name])
    # @user = @q.result(distinct: true)
  end 

  def edit
  end

  def update
  end

  def destroy
  end

  def private_chat
    # byebug
    @profile = Profile.find(params[:profile_id])
    @room = Room.where("rooms.name LIKE ?", "%" + @profile.username + "%").where("rooms.name LIKE ?", "%" + current_user.name + "%").take(1)
    if @room.size > 0
      redirect_to room_path(@room)
    else
      @room = Room.create( name: current_user.name + "_" + @profile.username )
      redirect_to room_path(@room.id)
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:username, :age, :phone_number, :email, :profile_pic)
  end
end