class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash.keep[:notice] = "Signed Up!"
      redirect_to :root    
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      render "new"
    end
  end


  def new
    @user = User.new   
  end

  def show
    @user = User.find(params[:id])
  end




private
  

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
