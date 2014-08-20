$ ->
  $('.show-token').click (e) ->
    e.preventDefault()
    $(@)
    .prev()
    .attr 'type', 'text'

  $('form').on 'click', 'input[type=submit]', (e) ->
    $(@).val 'Saving...'

  $('form').bind 'ajax:success', (e, data, status, xhr) ->
    $('input[type=submit]').hide 'fast'
    $('#config_command').text data.command
    $('.command').show 'fast'

  $('form').bind 'ajax:error', (e, data, status, xhr) ->
    $('input[type=submit]').hide 'fast'
    $('.error').show 'fast'
