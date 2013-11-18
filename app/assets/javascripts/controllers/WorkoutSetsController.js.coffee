angular.module('gymTrackerApp').controller "WorkoutSetsController", ($scope, $timeout, $routeParams, WorkoutSet, Exercise) ->
  #$scope.sortMethod = 'priority'
  #$scope.sortableEnabled = true

  $scope.init = () ->
    @workoutSetService = new WorkoutSet(serverErrorHandler)
    @exerciseService = new Exercise(serverErrorHandler)

    $scope.list = @exerciseService.find $routeParams.exercise_id

  $scope.addWorkoutSet = ->
    #raisePriorities()
    workoutSet = @workoutSetService.create(exercise_id: $routeParams.exercise_id, weight: $scope.workoutSetWeight, reps: $scope.workoutSetReps)
    #workoutSet.priority = 1
    $scope.list.workout_sets.unshift(workoutSet)
    $scope.workoutSetWeight = ""
    $scope.workoutSetReps = ""

  $scope.deleteWorkoutSet = (workoutSet) ->
    #lowerPrioritiesBelow(workoutSet)
    @workoutSetService.delete(workoutSet)
    $scope.list.workout_sets.splice($scope.list.workout_sets.indexOf(workoutSet), 1)

  #$scope.toggleWorkoutSet = (workoutSet) ->
    #@workoutSetService.update(workoutSet, completed: workoutSet.completed)

  $scope.exerciseNameEdited = (exerciseName) ->
    @exerciseService.update($scope.list, name: exerciseName)

  $scope.workoutSetEdited = (workoutSet) ->
    @workoutSetService.update(workoutSet, weight: workoutSet.weight, reps: workoutSet.reps)

  $scope.datePicked = (workoutSet) ->
    @workoutSetService.update(workoutSet, date: workoutSet.date)

  #$scope.priorityChanged = (workoutSet) ->
  #  @workoutSetService.update(workoutSet, target_priority: workoutSet.priority)
  #  updatePriorities()

  #$scope.sortableOptions =
  #  update: (e, ui) ->
  #    domIndexOf = (e) -> e.siblings().andSelf().index(e)
  #    newPriority = domIndexOf(ui.item) + 1

  #    workoutSet = ui.item.scope().workoutSet
  #    workoutSet.priority = newPriority

  #    $scope.priorityChanged(workoutSet)

  #$scope.changeSortMethod = (sortMethod) ->
  #  $scope.sortMethod = sortMethod
  #  if sortMethod == 'priority'
  #    $scope.sortableEnabled = true
  #  else
  #    $scope.sortableEnabled = false

  $scope.dateNullLast = (workoutSet) ->
    workoutSet.date ? '2999-12-31'

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")

  #updatePriorities = ->
    # During reordering it's simplest to just mirror priorities based on workoutSet
    # positions in the list.
  #  $timeout ->
  #    angular.forEach $scope.list.workout_sets, (workoutSet, index) ->
  #      workoutSet.priority = index + 1

  #raisePriorities = ->
  #  angular.forEach $scope.list.workout_sets, (t) -> t.priority += 1

  #lowerPrioritiesBelow = (workoutSet) ->
  #  angular.forEach workout_setsBelow(workoutSet), (t) ->
  #    t.priority -= 1

  workoutSetsBelow = (workoutSet) ->
    $scope.list.workout_sets.slice($scope.list.workout_sets.indexOf(workoutSet), $scope.list.workout_sets.length)
