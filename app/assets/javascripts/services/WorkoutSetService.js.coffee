angular.module('gymTrackerApp').factory 'WorkoutSet', ($resource, $http) ->
  class WorkoutSet
    constructor: (errorHandler) ->
      @service = $resource('/api/sets/:id',
        {id: '@id'},
        {update: {method: 'PATCH'}})
      @errorHandler = errorHandler

      # Fix needed for the PATCH method to use application/json content type.
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'

    create: (attrs) ->
      dt = new Date
      month = dt.getMonth()
      day = dt.getDate()
      year = dt.getFullYear()
      attrs.date = year + '-' + month + '-' + day
      new @service(workout_set: attrs).$save ((workout_set) -> attrs.id = workoutSet.id), @errorHandler
      attrs

    delete: (workoutSet) ->
      new @service().$delete {id: workoutSet.id}, (-> null), @errorHandler

    update: (workoutSet, attrs) ->
      new @service(workout_set: attrs).$update {id: workoutSet.id}, (-> null), @errorHandler

    all: ->
      @service.query((-> null), @errorHandler)
