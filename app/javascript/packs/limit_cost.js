jQuery(function(){
  $('#editModalLimit').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)
    var department_name = button.data('department')
    var degree_name = button.data('name')
    var degree_id = button.data('id')

    var modal = $(this)
    modal.find('.modal-body #department-name').text(department_name)
    modal.find('.modal-body #degree-name').text(degree_name)

    fetchLimit(degree_id).then(limits => {
      limits.forEach(limit => {
        var input = `
          <div class="form-group">
            <label>${limit.cost_type.name}</label>
            <input class="form-control" type="number" name="limit_cost[${limit.id}][limit]" id="limit_cost_name_${limit.id}" value="${limit.limit}">
          </div>
        `
        modal.find('.modal-body form .name').after(input)
      });
    });


  })

  async function fetchLimit(id) {
    const response = await fetch(`/api/v1/degree/limit_costs?id=${id}`);

    const limits = await response.json();
    return limits;
  }

});
