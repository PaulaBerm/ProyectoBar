
function mensaje() {
    swal({
        title: "Estás seguro de cerrar sesión?",
        text: "",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Si, cerrar sesión!",
        closeOnConfirm: false
    },
            function () {
                window.location.href = "index.html";
            });
}
;

//Filtro
$(document).ready(function () {
    $('.filterable .btn-filter').click(function () {
        var $panel = $(this).parents('.filterable'),
                $filters = $panel.find('.filters input'),
                $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });
    $('.filterable .filters input').keyup(function (e) {
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9')
            return;
        /* Useful DOM data and selectors */
        var $input = $(this),
                inputContent = $input.val().toLowerCase(),
                $panel = $input.parents('.filterable'),
                column = $panel.find('.filters th').index($input.parents('th')),
                $table = $panel.find('.table'),
                $rows = $table.find('tbody tr');
        /* Dirtiest filter function ever ;) */
        var $filteredRows = $rows.filter(function () {
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="' + $table.find('.filters th').length + '">RESULTADOS NO ENCONTRADOS</td></tr>'));
        }
    });
});



/*function confirmar(NumeroPedido) {
 if (confirm('Desea aceptar el pedido?')) {
 location.href = "ControladorEmp?accion=" + NumeroPedido;
 }
 }
 function confirm(url)
 {
 swal({
 title: "Aceptar pedido",
 text: "",
 type: "warning",
 showCancelButton: true,
 confirmButtonClass: "btn-danger",
 confirmButtonText: "Sí, aceptar!",
 closeOnConfirm: false
 },function (isConfirm) {
 if (isConfirm) {
 document.accion.action = url;
 document.accion.submit();
 swal("Aceptado!", "Your imaginary file has been deleted.", "success");
 } else {
 swal("Cancelled", "Your imaginary file is safe :)", "error");
 }
 });
 
 };
 
 
 
 
 $(document).ready(function ()
 {
 $("#myTable").DataTable();
 }
 );
 */

/*
 * 
 * 
 * 
 * 
 * 
 
 function confirm('ControladorEmp?accion=confirmar')
 {
 swal({
 title: "Aceptar pedido",
 text: "",
 type: "warning",
 showCancelButton: true,
 confirmButtonClass: "btn-danger",
 confirmButtonText: "Sí, aceptar!",
 closeOnConfirm: false
 },
 function () {
 document.accion.action = 'ControladorEmp?accion=confirmar';
 document.accion.submit();
 });
 
 }        ;
 
 
 * 
 * 
 function confirm(url){
 swal({
 title: "Are you sure?",
 text: "You will not be able to recover this imaginary file!",
 type: "warning",
 showCancelButton: true,
 confirmButtonColor: "#DD6B55",
 confirmButtonText: "Yes, delete it!",
 closeOnConfirm: false
 },
 function(){
 document.accion.action = url;
 document.accion.submit();
 swal("Deleted!", "Your imaginary file has been deleted.", "success");
 }); 
 };
 
 function confirm(url)
 {
 document.accion.action = url;
 document.accion.submit();
 
 
 }*/
/*
 function confirm(url) {
 swal({
 title: "Estás seguro de cerrar sesión?",
 text: "",
 type: "warning",
 showCancelButton: true,
 confirmButtonClass: "btn-danger",
 confirmButtonText: "Si, cerrar sesión!",
 closeOnConfirm: false
 },
 function () {
 window.open= url;
 });
 }
 ;
 
 /*
 function pregunta() {
 if (confirm('¿Esta seguro de modificar los campos?')) {
 document.accion.submit()
 }
 }
 */