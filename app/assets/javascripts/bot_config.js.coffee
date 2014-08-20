$ ->
  submitButton = $('input[type=submit]')

  $('.show-token').click (e) ->
    e.preventDefault()
    type = $(@).prev().attr 'type'
    if type == 'password'
      $(@).text('Hide token').prev().attr 'type', 'text'
    else
      $(@).text('Show token').prev().attr 'type', 'password'

  $('form').on 'submit', (e) ->
    if validateForm(@)
      submitButton.val 'Saving...'
    else
      e.preventDefault()
      e.stopPropagation()
      $('#invalid_config').show 'fast'

  $('form').bind 'ajax:success', (e, data, status, xhr) ->
    $('#invalid_config').hide 'fast'
    submitButton.hide 'fast'
    $('#config_command').text data.command
    $('.command').show 'fast'

  $('form').bind 'ajax:error', (e, data, status, xhr) ->
    $('#invalid_config').hide 'fast'
    submitButton.hide 'fast'
    $('.error').show 'fast'

  validateForm = (form) ->
    allFilled = true
    fields = $(form).find('input[type=text], input[type=password]')
    fields.each ->
      allFilled = ($(@).val().trim() != '')
    allFilled
