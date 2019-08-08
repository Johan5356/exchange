<%-- 
    Document   : Editarclave
    Created on : 9/06/2019, 12:26:46 PM
    Author     : jonathan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Exchange.proyecto.persistencia.vo.CategoriasVo"%>
<%@page import="java.util.List"%>
<%@page import="Exchange.proyecto.persistencia.dao.CategoriaDao"%>
<%@page import="Exchange.proyecto.persistencia.vo.usuariovo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambio de Clave</title>
        <link href="../css/estiloclave.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            form{

                background-color: #f4f4f4;

                padding: 3px;
                border: 1px solid #E1E1E1;
            }
            body {
                font:15px Arial, Helvetica, sans-serif;
                padding: 0;
                margin: 0;
                background-color: #f4f4f4;
            }
        </style>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            usuariovo usu = (usuariovo) session.getAttribute("usuario");
            CategoriaDao cd = new CategoriaDao();
            List<CategoriasVo> lista = cd.listar();

        %>
   
            <jsp:include page="../Encabezado.jsp"></jsp:include>
            

        <center>
            <img src="../img/logolargo.png">
        </center>
        <form class="formulario" method="POST" onclick="validar()" action="../clave?id=${usuario.getId()}">

        <h1>Cambio De Contraseña</h1>
        <div class="contenedor">
            <div class="input-contenedor">
                <i class="fas fa-key icon"></i>
                <input type="password" required=""  placeholder="Contraseña">

            </div>

            <div class="input-contenedor">
                <i class="fas fa-key icon"></i>
                <input type="password" id="clave1" required="" name="txtpassword" placeholder="Nueva Contraseña">

            </div>
            <span id="1" style="display: none">La contraseña no coinciden</span>
            <div class="input-contenedor">
                <i class="fas fa-key icon"></i>
                <input type="password" required="" id="clave2" placeholder="Confirmar Contraseña">

            </div>

            <input type="submit"  value="Cambiar Contraseña" class="button">
        </div>
    </form>
    <script>
        function validar() {
            clave = document.getElementById("clave").value;
            a = document.getElementById("clave2").value;
            if (clave !== a) {
                document.getElementById("1").style.display = "block";
                return false;

            }
        }

    </script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../js/jquery-3.4.1.min.js" type="text/javascript"></script>
</body>
</html>
