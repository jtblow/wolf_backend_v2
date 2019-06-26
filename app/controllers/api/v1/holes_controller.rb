module Api::V1
class HolesController < ApplicationController
  before_action :set_hole, only: [:show, :update, :destroy]

# GET /match
def index
  @holes = Hole.all

  render json: @holes
  def show
    render json: @hole
  end

  # POST /hole
  def create
    @hole = User.new(hole_params)

    if @hole.save
      render json: @hole, status: :created
    else
      render json: @hole.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /holes/1
  def update
    if @hole.update(hole_params)
      render json: @hole
    else
      render json: @hole.errors, status: :unprocessable_entity
    end
  end

  # DELETE /matches/1
  def destroy
    @hole.destroy
    if @hole.destroy
      head :no_content, status: :ok
    else
      render json: @hole.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hole
      @hole = Hole.find(params[:id])
    end

    # Only allow a trusted parameter "hole" through.
    def hole_params
      params.require(:hole).permit(:course_name, :wager)
    end
end
