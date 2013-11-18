angular.module('gymTrackerApp').factory 'Exercise', ($resource, $http) ->
  class Exercise
    constructor: (errorHandler) ->
      @service = $resource('/api/exercises/:id',
        {id: '@id'},
        {update: {method: 'PATCH'}})
      @errorHandler = errorHandler

      # Fix needed for the PATCH method to use application/json content type.
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'

    create: (attrs, successHandler) ->
      new @service(exercise: attrs).$save ((exercise) -> successHandler(exercise)), @errorHandler      

    delete: (exercise) ->
      new @service().$delete {id: exercise.id}, (-> null), @errorHandler

    update: (exercise, attrs) ->
      new @service(exercise: attrs).$update {id: exercise.id}, (-> null), @errorHandler
      
    all: ->
      @service.query((-> null), @errorHandler)

    find: (id, successHandler) ->
      @service.get(id: id, ((exercise)-> 
        successHandler?(exercise)
        exercise), 
       @errorHandler)

