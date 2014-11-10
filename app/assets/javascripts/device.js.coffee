jQuery ->
  $('input.switch-status').on 'change', (e) ->
    id = $(this).data('id')
    status = if $(this).is(':checked') then 'Stolen' else 'Active'
    $.ajax
      url: "/devices/#{$(this).data('id')}/update_status",
      method: 'post',
      dataType: 'script',
      data:
        device:
          status: status

  $('.simple_form')
    .bootstrapValidator
      message: 'This value is not valid',
      feedbackIcons:
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
      ,
      fields:
        device_key:
          message: 'The device_key is not valid',
          validators:
            notEmpty:
              message: 'The device_key is required and cannot be empty'
            stringLength:
              min: 6,
              max: 30,
              message: 'The device_key must be more than 6 and less than 30 characters long'
            regexp:
              regexp: /^[a-zA-Z0-9_]+$/,
              message: 'The device_key can only consist of alphabetical, number and underscore'
        email:
          validators:
            notEmpty:
              message: 'The email is required and cannot be empty'
            emailAddress:
              message: 'The input is not a valid email address'
