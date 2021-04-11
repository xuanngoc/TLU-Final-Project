jQuery(function(){
  $('#editModalDegree').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)
    var degree_name = button.data('degree-name')
    var name = button.data('name')
    var id = button.data('id')

    var modal = $(this)
    modal.find('.modal-body #degree-name').text(degree_name)

    modal.find('.modal-body .name input').val(name)

    modal.find('.modal-body form').attr('action', '/degree_levels/' + id);
  })

  $('#createModalDegree').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)
    var name = button.data('name')
    var id = button.data('id')


    var modal = $(this)
    var default_value = modal.find('.modal-body #degree-name').text()

    modal.find('.modal-body .select').val(id)
    modal.find('.modal-body #degree-name').text(name)
    modal.find('.modal-body form').attr('action', '/degree_levels');
  })
});
