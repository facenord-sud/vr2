# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  loading = false
  nearBottomOfPage = () ->
    $(window).scrollTop() > $(document).height() - $(window).height() - 200;
  getNextPage = () ->
    $('#paginate ul li a[rel=next]').attr('href')
  isFinished = () ->
    (getNextPage() == undefined) ? true : false
  $(window).scroll ->
    return if(loading)
    $('#to-top').toggle($(this).scrollTop()>200)
    url = getNextPage()
    if(nearBottomOfPage() && !isFinished())
      $.ajax({
        url: url,
        type: 'get',
        dataType: 'script',
        success: () ->
          loading = false
      })

$ ->
  if $('#is-mobile').css('display') == 'block'
    down = 235
  else
    down = 400
  $('#continue').on 'click', ->
    $('html, body').animate({scrollTop: $('#image').offset().top-down}, 'slow')
    #$('.contain-to-grid .top-bar').css('margin-top', '300px')
   ## $('#welcome').hide()

#$ ->
#  toTop = $(window).scrollTop()
#  stickyPosition = $('.my-sticky').offset().top
#  $(window).scroll ->
##    if $(window).scrollTop() > $(document).height() - $(window).height() - $('.my-sticky').offset().top
##      alert($(document).height() + ' ' + $(window).height()) #12888
##      alert($(window).scrollTop()) #12834
##      alert($('.my-sticky').offset().top) #2300.75
#    $('.my-sticky').offset({top: 2600, left: 300})