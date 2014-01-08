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