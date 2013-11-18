class WorkoutSetSerializer < ActiveModel::Serializer
  attributes :id, :name, :weight, :reps, :date

  def id
    object.id.to_s
  end

  def name
    object.exercise.name
  end
end
