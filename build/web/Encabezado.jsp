<%-- 
    Document   : Encabezado
    Created on : 11/07/2019, 05:46:35 PM
    Author     : 57313
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Exchange.proyecto.persistencia.vo.PublicarVO"%>
<%@page import="Exchange.proyecto.persistencia.vo.CategoriasVo"%>
<%@page import="java.util.List"%>
<%@page import="Exchange.proyecto.persistencia.dao.ProductoDAO"%>
<%@page import="Exchange.proyecto.persistencia.dao.ProductoDAO"%>
<%@page import="Exchange.proyecto.persistencia.dao.CategoriaDao"%>
<%@page import="Exchange.proyecto.persistencia.vo.usuariovo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta name = "viewport" content="width=device-width">
        <meta name = "description" content="Exchange mas que una familia">
        <meta name = "keywords" content="diseÃ±o web, desarrollo web, seo, posicionamiento web">
        <meta name = "author" content="Render-2Web">
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
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
    </head>
    <body>
        <%
            usuariovo vo = (usuariovo) session.getAttribute("usuario");
            CategoriaDao cd = new CategoriaDao();
            ProductoDAO pdao = new ProductoDAO();
            List<CategoriasVo> lista = cd.listar();
            List<PublicarVO> producto = pdao.verproducto();

        %>
       
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Exchange</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="inicio.jsp">Inicio</a></li>
                <li><a href="PublicarProducto.jsp">Publicar</a></li>
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
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">${usuario.getNombres()}
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">${usuario.getCorreo()}</a></li>
                        <li><a href="Perfil.jsp">Perfil</a></li>
                        <li><a href="editar.jsp">Editar Perfil</a></li>
                        <li><a href="Editarclave.jsp">Cambio de Contraseña</a></li>
                        <li><a href="../cerrar">Salir</a></li>
                    </ul>
                </li>

            </ul>
        </div>
    </nav>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
</body>
</html>
