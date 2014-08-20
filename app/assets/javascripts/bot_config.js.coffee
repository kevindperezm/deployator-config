$ ->
  $('.show-token').click (e) ->
    e.preventDefault()
    type = $(@).prev().attr 'type'
    if type == 'password'
      $(@).text('Hide token').prev().attr 'type', 'text'
    else
      $(@).text('Show token').prev().attr 'type', 'password'

  $('form').on 'click', 'input[type=submit]', (e) ->
    $(@).val 'Saving...'

  $('form').bind 'ajax:success', (e, data, status, xhr) ->
    $('input[type=submit]').hide 'fast'
    $('#config_command').text data.command
    $('.command').show 'fast'

  $('form').bind 'ajax:error', (e, data, status, xhr) ->
    $('input[type=submit]').hide 'fast'
    $('.error').show 'fast'
