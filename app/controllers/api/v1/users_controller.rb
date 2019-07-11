require "pry"
module Api::V1
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :user_matches]

# GET /users
def index
  @users = User.all

  render json: @users
end

def login
  @user = User.find_by username: params[:user][:username]
  if @user[:email] == params[:user][:email]
    render json: @user
  end
end

def user_matches
  render json: @user.matches.uniq{|m| m.id}
end

# GET /user/1
def show
  render json: @user
end

def find_user
  @user = User.find_by(username: params[:username])
  render json: @user
end

def user_match_holes
  holes = Hole.find_by(match_id: params[:match_id])
  render json: @user.holes
end



def find_multiple_users_by_name
  players = params[:playerNameList].split(',')
  playersObject = []
  players.each do | player |
    playersObject.push(User.find_by(username: player))
  end
  render json: playersObject
end

def find_multiple_users_by_id
  players = params[:playerIDList].split(',')
  playersObject = []
  players.each do | player |
    playersObject.push(User.find(player))
  end
  render json: playersObject
end

# POST /user
def create
  @user = User.new(user_params)
  if @user.save
    render json: @user, status: :created
  else
    render json: @user.errors, status: :unprocessable_entity
  end
end

# PATCH/PUT /users/1
def update
  if @user.update(user_params)
    render json: @user
  else
    render json: @user.errors, status: :unprocessable_entity
  end
end

# DELETE /users/1
def destroy
  @user.destroy
  if @user.destroy
    head :no_content, status: :ok
  else
    render json: @user.errors, status: :unprocessable_entity
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "user" through.
  def user_params
    params.require(:user).permit(:username, :email)
  end
end

end
