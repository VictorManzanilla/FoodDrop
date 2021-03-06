class Api::V1::AuthController < ApplicationController
   
  #   def create
  #     user = User.find_by(username: params[:username])
  #     if user && user.authenticate(params[:password])
  #       render json: user
  #     else
  #       render json: { error: 'Invalid username or password.'}
  #     end
  #  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id }
      token = JWT.encode(payload, 's3cret', 'HS256')
      #send user to FE
      render json: { id: user.id, username: user.username, token: token }
    else
      render json: { error: 'user or pw invalid' }
    end
  end #end of create action

  def show
    token = request.headers[:Authorization].split(' ').last
    decoded_token = JWT.decode(token, 's3cret', true, { algorithm: 'HS256'})
    user_id = decoded_token[0]['user_id']
    user = User.find(user_id)
    if user
      render json: { id: user.id, username: user.username, token: token }
    elserails
      render json: { error: 'invalid token' }
    end
  end #end of show action
end
  