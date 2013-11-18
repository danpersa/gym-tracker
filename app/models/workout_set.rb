class WorkoutSet
  include Mongoid::Document

  field :weight, type: Float
  field :reps, type: Integer
  field :date, type: Date

  belongs_to :exercise

  validates_presence_of       :reps
end