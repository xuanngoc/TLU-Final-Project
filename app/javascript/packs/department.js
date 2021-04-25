jQuery(function(){
  $('#editModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var code = button.data('code')
    var name = button.data('name')
    var id = button.data('id')



    fetch(`/departments/${id}/api/personnels`)
    .then(response => response.json())
    .then((users) => {
      var options = ''
      users.map(user => {
        var option = `<option value=${user.id}>${user.code} - ${user.full_name}</option>`;
        options += option;
      });

      $('#select-head-of').append(options)

    });


    var modal = $(this)
    modal.find('.modal-body .code input').val(code)
    modal.find('.modal-body .name input').val(name)

    modal.find('.modal-body form').attr('action', '/departments/' + id);
  })

  $('#deleteModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var name = button.data('name')
    var id = button.data('id')


    var modal = $(this)
    modal.find('.modal-tile').val(name)

    modal.find('.modal-body form').attr('action', '/departments/' + id);

  })
});
