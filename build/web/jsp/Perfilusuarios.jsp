<%-- 
    Document   : Perfilusuarios
    Created on : 1/07/2019, 10:28:18 PM
    Author     : jonathan
--%>

<%@page import="Exchange.proyecto.persistencia.vo.CategoriasVo"%>
<%@page import="Exchange.proyecto.persistencia.dao.CategoriaDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Exchange.proyecto.persistencia.dao.ProductoDAO"%>
<%@page import="Exchange.proyecto.persistencia.vo.PublicarVO"%>
<%@page import="java.util.List"%>
<%@page import="Exchange.proyecto.persistencia.vo.usuariovo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
        <title>Perfil</title>
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
            PublicarVO perfil = (PublicarVO) session.getAttribute("perfil");
            ProductoDAO pdao = new ProductoDAO();
            CategoriaDao cd = new CategoriaDao();
            List<PublicarVO> producto = pdao.listar(perfil.getId_usuario());
            List<CategoriasVo> lista = cd.listar();
        %>               

        <jsp:include page="../Encabezado.jsp" ></jsp:include>



            <div class="container">
                <div class="row" style="border: 1px solid #E1E1E1;">
                    <div class="col-md-4">
                        <img src="" width="250" height="250">                    
                    </div>
                    <div class="col-md-8">
                        <br>
                        <div class="col-md-5">
                            <h4>Nombre : ${perfil.getUsuario().getNombres()}</h4>
                        <br>
                        <br>
                        <h4>Telefono : ${perfil.getUsuario().getTelefono()} </h4>
                        <br>
                        <br>                        
                    </div>
                    <div class="col-md-7">                                              
                        <h4> ${perfil.getUsuario().getCorreo()}</h4>
                        <br>
                        <br>       
                        <h4>Ciudad : ${perfil.getUsuario().getCiudadVO().getDescripcion()}</h4>
                        <br>
                        <br>                                              
                    </div>
                </div>
            </div>
            <br>
            <br>
            <br>
            <c:forEach var="pd" items="<%=producto%>">
                <div class="container">

                    <div class="row" style="border: 1px solid #E1E1E1;" >

                        <div class="col-md-3" >
                            <img src="../consultarimagen?id=${pd.getId_publicar()}" width="170" height="170">
                        </div>
                        <div class="col-md-4" >
                            <h3>${pd.getNombre()}</h3>
                            <br>
                            <p style="border: 1px solid #E1E1E1;">${pd.getDescripcion()}</p>
                        </div>
                        <div class="col-md-3">
                            <br>                      
                            <a><input type="submit" class="form-control btn btn-primary" value="Agendar cita " ></a>
                            <br>
                            <br>                               
                        </div>                   
                    </div>                    
                </div>
            </div>
        </c:forEach>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/jquery-3.4.1.min.js" type="text/javascript"></script>
    </body>
</html>

