$(document).ready(function(){
    $("tr #btnDelete").click(function(){
        var idp=$(this).parent().find("#idp").val();
        var warning = 'Seguro que quiere eliminar este producto?';
        if (confirm(warning)) {
            parent.location.href= "ControladorC?accion=Delete&id="+idp;
            parent.location.href= "ControladorC?accion=Carrito";
        }        
    });    
});


