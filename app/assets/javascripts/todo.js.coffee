# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

app = angular.module("Todo", ["ngResource"])

app.filter 'stars', ->
	stars = [
     '\u2605',
     '\u2605\u2605',
     '\u2605\u2605\u2605',
     '\u2605\u2605\u2605\u2605',
     '\u2605\u2605\u2605\u2605\u2605'
	]
	(starcount) -> 
		stars[starcount-1]


#Need to change function with dependency into array : first element = service names as strings
#Otherwise => minification in production will break dependency injection

app.factory "Entry", ["$resource", ($resource)->
	$resource("/entries/:id", {id: "@id"}, {update: {method: "PUT"}})
	]

@TodoController = ["$scope", "Entry", ($scope, Entry) ->
	
	$scope.entries = Entry.query()
	
	$scope.addEntry = ->
		entry = Entry.save($scope.newEntry)
		$scope.entries.push(entry)
		$scope.newEntry = {}
		
	$scope.markAsDone = (index) ->
		entry = $scope.entries[index]
		entry.done = !entry.done
		entry.$update()
		
	$scope.deleteTask = (index) ->
		entry = $scope.entries[index]
		entry.$delete()
		$scope.entries = Entry.query()
		
	]
	

		
		
		
	