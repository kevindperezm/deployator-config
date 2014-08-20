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
      $('#invalid_config').hide 'fast'
      submitButton.val 'Saving...'
    else
      e.preventDefault()
      e.stopPropagation()
      $('#invalid_config').show 'fast'

  $('form').bind 'ajax:success', (e, data, status, xhr) ->
    $('#config_command').text data.command
    hideSubmitAndShow '.command', 'fast'

  $('form').bind 'ajax:error', (e, data, status, xhr) ->
    hideSubmitAndShow '.error', 'fast'

  validateForm = (form) ->
    allFilled = true
    fields = $(form).find('input[type=text], input[type=password]')
    fields.each ->
      allFilled = ($(@).val().trim() != '')
    allFilled

  hideSubmitAndShow = (whatToShow, speed) ->
    $('#invalid_config').hide speed
    submitButton.hide speed
    $(whatToShow).show speed
