class Api::V1::UsersController < ApplicationController
    def index 
        @users= User.all 
        @users.map
        render json: @users
    end

    def show
        user= User.find_by(id: params[:id])

    end

    def create
        user= User.create(user_params)
        if user.valid?
            render json: { user: UserSerializer.new(user)},status: :created
        else
            render json: {error: 'Failed to create User, check credentials and try again!'}, status: :not_acceptable
        end
    end
    def update
        @user= User.find(params[:id])
        if @user.update(user_params_update)
            render json:@user
        else
            render json: {error: 'Failed to UPDATE User, check credentials and try again!'}, status: :not_acceptable
        end
      end
      def destroy
        user=User.find(params[:id])
        user.destroy
        render json: user
      end

end
private
def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:bio,:birthDate,:gender,:sexualOrientation,:zodiac,:age,:profile_image)
    # :image_file_name
end
private
def user_params_update
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:bio,:birthDate,:gender,:sexualOrientation,:zodiac,:age,:posts,:profile_image,:user_one_chatrooms,:user_two_chatrooms)
    # :image_file_name
end