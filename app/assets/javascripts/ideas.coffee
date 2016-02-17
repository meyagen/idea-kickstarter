#= require jquery
#= require semantic-ui

# ============================
# DELETE IDEA
# ============================

delete_idea = (url) ->
  $.ajax
    url: url
    type: 'DELETE'
    dataType: 'json'
    complete: ->
      return
  return

$('.delete').click ->
  id = $(this).data('id')
  url = '/ideas/' + id
  delete_idea(url)

  idea = $(this).parents('.idea-item')
  idea.slideUp('slow')


# ============================
# CREATE IDEA
# ============================

$('#create-button').on 'click', ->
  $('#create-modal').modal 'show'
  return

$('#cancel-create').on 'click', ->
  $('#create-modal').modal 'hide'
  return


# ============================
# GIVE KUDOS
# ============================

add_kudos = (url) ->
  $.ajax
    url: url
    type: 'POST'
    dataType: 'json'
    complete: ->
      return
  return

$('.heart').click ->
  id = $(this).data('id')
  url = '/ideas/' + id + '/kudos'
  add_kudos(url)

  # update kudos immediately
  idea = $(this).parents('.idea-item')
  kudos_element = idea.find('.kudos')
  kudos_string = $(kudos_element).html()
  kudos = parseInt(kudos_string.split(' ')[0]) + 1

  $(kudos_element).html(kudos + " kudos!")


# ============================
# CLOSE FLASH MESSAGE
# ============================

$('i.close').click ->
  $(this).closest('.message').transition('fade')