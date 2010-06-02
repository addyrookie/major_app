class UsersController < ApplicationController

  before_filter :authenticate  , :only => [:edit , :update , :index]
  before_filter :correct_user  , :only => [:edit , :update]
  before_filter :admin_user    , :only => :destroy

  def destroy 
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed "
    redirect_to users_path
  end
    
 
  def new
    @user  = User.new 
    @title = "Sign up"
  end

  def show 
    @user       = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page]) 
    @title      =CGI.escapeHTML(@user.name) 
  end

  def create 
   @user = User.new(params[:user])
   if @user.save
      sign_in @user
     flash[:success] = "Welcome to the Sample App!"
     # redirect_to user_path(@user)
     redirect_to @user
   else
   @title = "Sign up"
   render 'new'
   end
  end 

  def edit
    @title = "Edit user"
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      @title = "Edit user" 
      render :edit
    end
  end



# index method for displaying all users on a single page 
  def index 
    @title = "All users"
    @users = User.paginate(:page =>  params[:page])
  end 
 



 private
  
   def correct_user 
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end


#found  mistake in the book . if the user is not signed in , it's current_user value will not be set
# and admin? method is pointless in this case
#  altered admin_user method is given below  
   def admin_user
     if current_user.nil?
        redirect_to(signin_path) 
     else
     redirect_to(root_path) unless (current_user.admin?)
     end
   end
end

