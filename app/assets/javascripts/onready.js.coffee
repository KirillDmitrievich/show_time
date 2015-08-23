when_page_ready = ->
  $('.tag-it').tagit
    'availableTags': $('#tags').text()
    'preprocessTag': (val) ->
      if !val
        return ''
      $('#user_tags').val($('#user_tags').val() + ' ' + val.toUpperCase())
      val.toUpperCase()

  $('.sentence__add-comment').click ->

    $(this).parent().html($(this).data('html'))

    $('.comment__ajax-submit').click ->
      data  = {}
      valid = true
      $('.invalid').removeClass('invalid')

      $(this).parent().children('input, textarea').each ->
        if $(this).val()==''
          valid = false
          $(this).addClass('invalid')
        else
          data[this.id] = $(this).val()

      if valid
        $.post '/sentence/add_comment', data,
          ((response) =>
            console.log $(this).parent()
            $(this).parent().html(response.html)
          )


$(document).on 'page:load', ->
  when_page_ready()

$(document).ready ->
  when_page_ready()