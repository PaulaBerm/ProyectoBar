$(document).ready(function(){
    $("tr #btnDelete").click(function(){
        var idp=$(this).parent().find("#idp").val();
        var warning = 'Seguro que quiere eliminar este producto?';
        if (confirm(warning)) {
            parent.location.href= "ControladorC?accion=Delete&id="+idp;
            parent.location.href= "ControladorC?accion=Carrito";
        }        
    }); 

    $("tr #Cantidad").click(function (){
        var idp = $(this).parent().find("#idp").val();
      
        var url="ControladorC?accion=ActualizarCantidad";
        $.ajax({
            type: 'POST',
            url : url,
            data: "idp=" + idp + "&Cantidad" + Cantidad,
            success: function (data, textStatus, jqXHR) {
                location.href="ControladorC?accion=Carrito";
            }
            
        });
    });


});


