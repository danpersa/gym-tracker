class Exercise
  include Mongoid::Document
  field :name, type: String

  has_many :workout_sets

  belongs_to :user

  validates_presence_of       :name
  validates_length_of         :name, maximum: 50
end