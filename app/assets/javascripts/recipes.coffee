# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on "change", "input[type~=checkbox]", ->
    url = $(this).data("url")
    $.ajax(url, dataType: "script", method: "POST")