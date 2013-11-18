namespace :db do
  desc "Fill database with sample data "
  task :populate => :environment do
    Mongoid.logger.level = Logger::INFO
    Moped.logger.level = Logger::INFO

    Mongoid.purge!
    beginning_time = Time.now


    user = create_user 'dix.of.ix'
    make_exercises_with_workout_sets user
    
    end_time = Time.now
    debug "Time elapsed #{(end_time - beginning_time)} seconds"
    puts
  end
end

# def make_users
#  debug 'make users:'
#  5.times do |n|
#    create_user "name#{n}", n
#    print "."
#  end
# end

def create_user name
  User.create name: name,
              uid: "1083916167",
              provider: "facebook"
end

def make_exercises_with_workout_sets user
  debug 'make exercises:'
  ex1 = Exercise.create name: "Smith Machine Bench Press", user: user
  WorkoutSet.create exercise: ex1, date: Time.now, weight: 35.0, reps: 10
  print '.'
  WorkoutSet.create exercise: ex1, date: Time.now, weight: 45.0, reps: 12
  print '.'
  WorkoutSet.create exercise: ex1, date: Time.now, weight: 50.0, reps: 10
  print '.'
  WorkoutSet.create exercise: ex1, date: Time.now, weight: 50.0, reps: 10
  print '.'
  ex2 = Exercise.create name: "Push Up", user: user
  print '.'
  ex3 = Exercise.create name: "Barbell Bench Press", user: user
  print '.'
  ex4 = Exercise.create name: "Back Pulldown", user: user
  print '.'
  ex5 = Exercise.create name: "Crunch", user: user
  print '.'
  ex6 = Exercise.create name: "Back Extension", user: user
  print '.'
  ex7 = Exercise.create name: "Machine Shoulder Press", user: user
  print '.'
end

def debug message
  puts
  print message
  Rails.logger.info message
end