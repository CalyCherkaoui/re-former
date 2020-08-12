class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # when we submit the form in users/new.html.erb we activate users#create action
    # we create a new instance of user by passing params get from the form
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)
    # we save the user instance! If its valid (according to validates rules in user model app/models/user.rb) we get to new_user_path else we get to URL/users

    if @user.save
      redirect_to users_path
    else
      render :new
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User successfully deleted'
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
