class Api::V1::AuthController < ApplicationController
    def create
       user =User.find_by(email: params[:email])
        payload= {user_id: user.id}
        token=JWT.encode(payload,'secret','HS256')
# @@password=params[:password]

        if user && user.authenticate(params[:password])
            render json: {user: user,token:token}
        else
            render json: {error: "Invalid Credentials, please try again."}, status: 401
        end
    end
    
    def show
        token = request.headers[:Authorization].split(" ")[1]
        decoded_token= JWT.decode token, "secret", true,{algorithm: "HS256"}
       user_id= decoded_token[0]['user_id']
       user=User.find(user_id)
       if user
  
        render json: {id:user_id, email: user.email,name: user.name,bio: user.bio,gender:user.gender,birthDate: user.birthDate,sexualOrientation: user.sexualOrientation,zodiac: user.zodiac,age: user.age,chatrooms:user.user_one_chatrooms,token:token, posts:user.posts,profile_image:user.profile_image}
        # image_file_name: user.image_file_name
       else
        render json: {error: 'Invalid Token'}, status: 401
       end
    end
end