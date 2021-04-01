jQuery(function(){
  $('#editModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var code = button.data('code')
    var name = button.data('name')
    var id = button.data('id')


    var modal = $(this)
    modal.find('.modal-body .code input').val(code)
    modal.find('.modal-body .name input').val(name)

    modal.find('.modal-body form').attr('action', '/department/' + id);

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
