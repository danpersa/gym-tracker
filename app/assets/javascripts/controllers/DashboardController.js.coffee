angular.module('gymTrackerApp').controller "DashboardController", ($scope, $routeParams, $location, Exercise) ->

  $scope.init = ->        
    @exercisesService = new Exercise(serverErrorHandler)
    $scope.exercises = @exercisesService.all()

  $scope.createExercise = (name) ->
    @exercisesService.create name: name, (exercise) ->
        $location.url("/exercises/#{exercise.id}")

  $scope.deleteExercise = (exercise, index) ->
    result = confirm "Are you sure you want to remove this exercise?" 

    if result
      @exercisesService.delete exercise
      $scope.exercises.splice index, 1

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")
