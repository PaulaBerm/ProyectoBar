<%-- 
    Document   : autenticacionEmp
    Created on : 12/11/2020, 09:19:20 PM
    Author     : Paula
--%>
<%@page import="ModeloVO.CUsuario"%>
<%@page import="Controlador.EmpleadoC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    EmpleadoC emp = new EmpleadoC();
    HttpSession objsesion = request.getSession(true);
    String correo = (String) objsesion.getAttribute("usuario");

    String nombre = emp.buscarNombre(correo);
    CUsuario user = (CUsuario) emp.list(correo);
    if (correo.equals("")) {
        out.print(correo);
        out.print(nombre);

    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>INBAR | Mesero </title>
    <link rel="icon" type="image/x-icon" href="../assets/img/Logo_2.png"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/authentication/form-2.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <link rel="stylesheet" type="text/css" href="../assets/css/forms/theme-checkbox-radio.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/forms/switches.css">
</head>
<body class="form no-image-content">
    

    <div class="form-container outer">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">

                        <div style="align-items: flex-end;">
                            <a href="auth_pass_recovery_boxed.html" class="forgot-pass-link">Volver atrás</a>
                        </div>

                        <div class="d-flex user-meta">
                            <!--<img src="assets/img/90x90.jpg" class="usr-profile" alt="avatar">-->
                            
                            <br><br>
                            <div class="">
                                <p class=""><%out.print(nombre);%></p>
                                <h6>Ingrese nuevamente su contraseña para poder realizar cambios en su cuenta</h6>
                            </div>
                        </div>

                        <form class="text-left">
                            <div class="form">
                                <div id="password-field" class="field-wrapper input mb-2">
                                    <div class="d-flex justify-content-between">
                                        <label for="password">Contraseña</label>
                                    </div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                                    <input id="password" name="password" type="password" class="form-control" placeholder="Contraseña">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" id="toggle-password" class="feather feather-eye"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                                </div>
                                <div class="d-sm-flex justify-content-between">
                                    <div class="field-wrapper">
                                        <button type="submit" class="btn btn-primary" value="">Ingresar</button>
                                    </div>
                                </div>

                            </div>
                        </form>

                    </div>                    
                </div>
            </div>
        </div>
    </div>

    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../assets/js/libs/jquery-3.1.1.min.js"></script>
    <script src="../assets/js/popper.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="../assets/js/authentication/form-2.js"></script>

</body>
</html>
