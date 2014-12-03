jQuery ->
  $('.homepage-links').on 'click', ->
    $('.homepage-links').parents('li').removeClass 'hide'
    $(this).parent('li').addClass 'hide'
    $(".header-bottom .pages").slideUp()
    $(".header-bottom .#{$(this).data('type')}").removeClass 'hide'
    $(".header-bottom .#{$(this).data('type')}").slideDown()

  $(".alert").css "left", ($("body").outerWidth() - $(".alert").width()) / 2
