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
