#= require jquery
#= require semantic-ui

delete_todo = (url) ->
  $.ajax
    url: url
    type: 'DELETE'
    data: { "authenticity_token": "<%= form_authenticity_token %>" },
    dataType: 'json'
    complete: ->
      return
  return

$('.delete').click ->
  id = $(this).data('id')
  url = '/to_dos/' + id
  delete_todo(url)
  todo = $(this).parents('.todo-item')
  todo.slideUp('slow')

