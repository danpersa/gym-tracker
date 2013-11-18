class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :workout_sets

  def id
    object.id.to_s
  end
end
