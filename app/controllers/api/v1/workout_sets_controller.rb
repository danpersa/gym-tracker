class Api::V1::WorkoutSetsController < Api::V1::BaseController
  #before_action :check_owner

  def index
    render json: workout_sets, serializer: WorkoutSetsSerializer
  end

  def show
    render json: workout_set, status: 200, serializer: WorkoutSetSerializer
  end

  def create
    workout_set = WorkoutSet.create!(safe_params)
    if workout_set.date.nil?
      workout_set.date = Time.now
    end
    workout_set.save
    render json: workout_set, status: 201, serializer: WorkoutSetSerializer
  end

  def update
    workout_set.update_attributes(safe_params)
    render nothing: true, status: 204
  end

  def destroy
    workout_set.destroy
    render nothing: true, status: 204
  end

  private
  def workout_sets
    @workout_sets ||= WorkoutSet.all
  end

  def workout_set
    @workout_set ||= WorkoutSet.where(_id: params[:id]).first
  end

  def safe_params
    params.require(:workout_set).permit(:id, :exercise_id, :weight, :reps, :date)
  end
end
