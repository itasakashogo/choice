# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#article-tags').tagit
    fieldName:   'category_list'
    singleField: true
  $('#article-tags').tagit()
  category_string = $("#category_hidden").val()
  try
    category_list = category_string.split(',')
    for tag in category_list
      $('#article-tags').tagit 'createTag', tag
  catch error

$(document).on 'ready page:load', ->
  $('.admin-articles #article-tags').tagit
    fieldName:   'article[tag_list]'
    singleField: true
    availableTags: gon.available_tags


  if gon.article_tags?
    for tag in gon.article_tags
      $('#article-tags').tagit 'createTag', tag



