module.exports =
  $(document).on 'ready page:load', ->
    $('.select2-select').select2
      theme: 'bootstrap'