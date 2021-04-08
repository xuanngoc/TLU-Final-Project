jQuery(function(){
  $('#createModalPersonnel').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)
    var department = button.data('department')
    var name = button.data('name')
    var id = button.data('id')

    var modal = $(this)
    modal.find('.modal-body .degree_level_id input').val(id)

    modal.find('.modal-body #department-name').text(department)
    modal.find('.modal-body #degree-name').text(name)
  })

  $('#editModalPersonnel').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)
    var code = button.data('degree_type')
    var name = button.data('name')
    var id = button.data('id')

    var modal = $(this)
    modal.find('.modal-body .degree_type input').val(code)
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
