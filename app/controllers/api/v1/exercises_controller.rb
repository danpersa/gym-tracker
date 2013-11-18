class Api::V1::ExercisesController < Api::V1::BaseController

  before_action :check_owner, only: [:show, :update, :destroy]

  def index
    render json: exercises, serializer: ExercisesSerializer
  end

  def show
    render json: exercise, status: 200, serializer: ExerciseSerializer
  end

  def create
    ex = Exercise.create!(safe_params.merge user_id: current_user.id)
    render json: ex, status: 201, serializer: ExerciseSerializer
  end

  def update
    exercise.update_attributes(safe_params)
    render nothing: true, status: 204
  end

  def destroy
    workout_sets = WorkoutSet.where(exercise_id: exercise.id)
    workout_sets.each do |workout_set|
      workout_set.destroy
    end
    exercise.destroy
    render nothing: true, status: 204
  end

  private
  def exercises
    @exercises ||= Exercise.where(user_id: current_user.id)
  end

  def exercise
    @exercise ||= Exercise.where(_id: params[:id]).first
  end

  def safe_params
    params.require(:exercise).permit(:id, :name)
  end

  def check_owner
    permission_denied if current_user != exercise.user
  end
end
