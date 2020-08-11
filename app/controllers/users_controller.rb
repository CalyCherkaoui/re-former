class UsersController < ApplicationController
  def new
  end

  def create
    # when we submit the form in users/new.html.erb we activate users#create action
    # we create a new instance of user by passing params get from the form
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    # we save the user instance! If its valid (according to validates rules in user model app/models/user.rb) we get to new_user_path else we get to URL/users

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end

  end
end
