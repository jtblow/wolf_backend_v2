module Api::V1
class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :update, :destroy, :match_holes, :match_users]

# GET /match
def index
  @matches = Match.all
  render json: @matches
end

  def show
    render json: @match
  end

def match_holes
  render json: @match.holes
end

def match_users
  render json: @match.users
end
  # POST /match
  def create
    @match = Match.new(match_params)
    if @match.save
      render json: @match, status: :created
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /matches/1
  def update
    if @match.update(match_params)
      render json: @match
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  # DELETE /matches/1
  def destroy
    @match.destroy
    if @match.destroy
      head :no_content, status: :ok
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a trusted parameter "match" through.
    def match_params
      params.require(:match).permit(:course_name, :wager)
    end
  end
end
