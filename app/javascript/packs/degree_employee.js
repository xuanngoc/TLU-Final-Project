jQuery(function(){
  $('#editModalDegree').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)
    var code = button.data('degree_type')
    var name = button.data('name')
    var id = button.data('id')
    console.log(name)


    var modal = $(this)
    modal.find('.modal-body .degree_type input').val(code)
    modal.find('.modal-body .name input').val(name)

    modal.find('.modal-body form').attr('action', '/degree_employees/' + id);
  })

  $('#deleteModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var name = button.data('name')
    var id = button.data('id')


    var modal = $(this)
    modal.find('.modal-tile').val(name)

    modal.find('.modal-body form').attr('action', '/department/' + id);

  })
});
