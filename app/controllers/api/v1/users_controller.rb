class Api::V1::UsersController < ApplicationController
  # validates :username, uniqueness: true
  
  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: { user: UserSerializer.new(@user), token: issue_token(user_id: @user.id) }, status: :created
    else
      render json: { errors: ['Username exists already!'] }
    end
  end
  # token issued via BCrypt Gem
  # this new create method (old is commented below) removes status text because I can't 
  # get Rails to return the custom JSON alongside the status text for some reason. Now frontend 
  # renders the returned error json msg

  # def create
  #   @user = User.create(user_params)
  #   if @user.valid?
  #     render json: { user: UserSerializer.new(@user), token: issue_token(user_id: @user.id) }, status: :created
  #   else
  #     render json: { errors: ['failed to create user'] }, status: :not_acceptable
  #   end
  # end

  def login
    user = User.find_by(username: login_params[:username])
    if user&.authenticate(login_params[:password])
      render json: { user: UserSerializer.new(user), token: issue_token(user_id: user.id) }
    else
      render json: { errors: ['Username or password incorrect'] }
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def index
    @users = User.all
    render json: @users
  end

# See notes for how this method works, and where it fits into the process of controlling what the API exposes.  
  def validate
    if logged_in
      render json: { user: UserSerializer.new(@current_user), token: issue_token(user_id: @current_user.id) }
    else
      render json: { errors: ['Invalid token'] }, status: :not_accepted
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
# user_params expects a user object, containing another object, which contains keys of username and password. That happens from the submit of the signup form on frontend which calls POST fetch to the appropriate endpoint (/users) and jsonify's & sends an object in the EXACT STRUCTURE just mentioned and defined by user_params method.


  def login_params
    params.require(:user).permit(:username, :password)
  end
end
# login_params doesn't req password_confirmation because it was done once as signup
