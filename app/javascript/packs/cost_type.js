jQuery(function(){
  $('#editModalCostType').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)
    var name = button.data('name')
    var id = button.data('id')

    var modal = $(this)
    modal.find('.modal-body .name input').val(name)

    modal.find('.modal-body form').attr('action', '/cost_types/' + id);
  })

});
