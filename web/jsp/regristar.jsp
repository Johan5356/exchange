<%-- 
    Document   : regristar
    Created on : 29/05/2019, 01:46:55 PM
    Author     : jonathan
--%>

<%@page import="Exchange.proyecto.persistencia.vo.CategoriasVo"%>
<%@page import="Exchange.proyecto.persistencia.dao.CategoriaDao"%>
<%@page import="Exchange.proyecto.persistencia.dao.departamentoDao"%>
<%@page import="Exchange.proyecto.persistencia.vo.DepartamentosVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="Exchange.proyecto.persistencia.dao.CiudadDao"%>
<%@page import="Exchange.proyecto.persistencia.vo.CiudadVO"%>
<%@page import="Exchange.proyecto.persistencia.vo.usuariovo"%>
<%@page import="Exchange.proyecto.persistencia.conexion.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>

        <meta charset="UTF-8">
        <title>Registrar</title> 

        <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="../js/validacion.js"></script>   

    </head>  
    <body>

        <%

            departamentoDao dao = new departamentoDao();
            CiudadDao cd = new CiudadDao();
            CategoriaDao ca = new CategoriaDao();
            List<CiudadVO> ciudades = cd.ciudades();
            List<DepartamentosVo> departamentos = dao.departamentos();
            List<CategoriasVo> lista = ca.listar();

        %>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Exchange</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="inicio.jsp">Inicio</a></li>

                    <li><a href="#">Ayuda</a></li>
                </ul>
                <ul class="nav navbar-nav ">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categorias
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <c:forEach var="ca" items="<%=lista%>">
                                <li><a href="Categoria.jsp?idcategoria=${ca.getIdCategoria()}">${ca.getDescripcion()}</a></li>
                                </c:forEach>


                        </ul>
                    </li>

                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="jsp/regristar.jsp"><span class="glyphicon glyphicon-user"></span> Regristarse</a></li>
                    <li><a href="../html/loginvista.html"><span class="glyphicon glyphicon-log-in"></span> Ingresar</a></li>
                </ul>
            </div>
        </nav>
        <br>
    <center>
        <img src="../img/logolargo.png">
    </center>
    <form class="formulario" action="../regristar" method="Post"  >
        <h3 style="color: red">${error}</h3>
        <h1>Registrar</h1>
        <div class="contenedor">

            <div class="input-contenedor">
                <input type="text" name="txtnombre" required=""  placeholder="Nombre Completo">

            </div>

            <div class="input-contenedor">
                <input type="text" name="txtcorreo" required="" id="correo" placeholder="Correo Electronico">
            </div>
            <span id="mensaje" style="color:red ; width: 50px"> </span>
            <div class="input-contenedor"> 
                <input type="password"  name="txtpassword"  id="clave" placeholder="Contraseña">

            </div>
            <span id="mensaje2" style="color:red"> </span>
            <div class="input-contenedor">
                <input type="password" name="" id="clave2" placeholder="Confirme Contraseña">  
            </div>
            <span id="" style="color:red"> </span>
            <div class=" input-contenedor">
                <input type="text" name="txttelefono" class="" id="telefono" onkeypress="" placeholder="Telefono">
            </div>
            <div class="form-group">
                <select class="form-control" name="country" id="departamento"  required="" >               
                    <option value="0">Departamentos</option>
                    <c:forEach var="depa" items="<%=departamentos%>">
                        <option value="${depa.getIddepartamento()}" >${depa.getDescripcion()}</option>
                    </c:forEach>   
                </select>
            </div>

            <div class="form-group ">
                <select class="form-control"name="txtciudad" id="ciudad" required="" >

                    <option value="0">Ciudad</option>
                    <c:forEach var="ciudad" items="<%=ciudades%>">
                        <option  value="${ciudad.getIdciudad()}">${ciudad.getDescripcion()}</option>
                    </c:forEach>

                </select>
            </div>
            <div class="form-group "> 
                <select name="sexo" class="form-control" id="genero" required="">
                    <option>Genero</option>
                    <option>Masculino</option>
                    <option>Femenino</option>
                </select>
            </div>
            <br>
            <input type="submit" name="accion" value="Registrate" class="button">
            <p>Al registrarte, aceptas nuestras Condiciones de uso y Política de privacidad.</p>
            <p>¿Ya tienes una cuenta?<a class="link" href="../html/loginvista.html">Iniciar Sesion</a></p>
        </div>
    </form>
    <script src="../js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>