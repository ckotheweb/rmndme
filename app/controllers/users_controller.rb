########################################################################################
#== This is the users controller which has been created in order to get more from devise
########################################################################################

class UsersController < ApplicationController
    
    before_filter :authenticate_user! # Non-authenticated users can only see list of users
    
    before_action :set_user, only: [:show, :edit, :update, :destroy] #Actions which are allowed to perform against user
    
    #Show selected user
    def show
        @user = User.find(params[:id])
    end
    
    #List all users
    def index 
        @users = User.all
    end
    
    #Destroy user method
    def destroy
    @user.destroy
        respond_to do |format|
            format.html { redirect_to users_url, notice: 'User has been deleted.' }
            format.json { head :no_content }
        end
    end
    
    #Update user details method
    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to @user, notice: 'Account has been successfully updated.' }
                format.json { render :show, status: :ok, location: @user }
            else
                format.html { render :show }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end
    
    
    private
        #Setting a user to make an action against
        def set_user
            @user = User.find(params[:id])
        end
        
        #Settings user params for update method
        def user_params
            params.require(:user).permit(:email, :password, :admin)
        end
end