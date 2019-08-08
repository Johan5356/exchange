<%-- 
    Document   : PublicarProducto
    Created on : 24/06/2019, 01:49:10 PM
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
        <title>Publicación</title>
        <link href="../css/estiloprincipal.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="../css/estilo.css">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
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
                usuariovo usu = (usuariovo) session.getAttribute("usuario");
                usuariovo vo = (usuariovo) session.getAttribute("usuario");
                CategoriaDao cd = new CategoriaDao();
                List<CategoriasVo> lista = cd.listar();
            %>
          <jsp:include page="../Encabezado.jsp"></jsp:include>
        
       
    <center>
        <img src="../img/logolargo.png">
    </center>
    <form action="../publicar?id=${usuario.getId()}" enctype="multipart/form-data" method="POST">
        <div class="container">
            <center>
                <h1>Publicar Producto</h1>
            </center>
            <div class="row">

                <div class="col-sm-8 ">
                    <div class="col-lg-8">
                        <label>Nombre del producto</label>
                        <input type="text" name="nombre" class="form-control">
                        <div>
                            <label for="Descipcion">Descipcion</label>
                            <textarea class="form-control" id="Descripcion" name="descripcion" rows="6"></textarea>
                        </div>
                    </div>	
                    <br>                      
                    <div class="rows ">
                        <div class="form-group">
                            <div class="col-md-6 ">
                                <label>Precio estimado</label>
                                <input type="text" name="precio"class="form-control">	
                            </div>

                            <div class="col-md-6 ">
                                <label>Cantidad</label>
                                <select class="form-control" name="size" id="size">
                                    <option value="Seleccione una opcion">Seleccione una opcion</option>
                                    <% for (int i = 1; i <= 30; i++) {%>
                                    <option value='<%= i%>'><%= i%></option>
                                    <%}%>
                                </select>	
                            </div>
                        </div>
                    </div>     
                    <div class="form-group">			  
                        <div class="col-md-6 ">
                            <label>Marca</label>
                            <input type="text" name="marca"class="form-control">	
                        </div> 
                        <div class="col-md-6 ">
                            <label>Tiempo de uso</label>
                            <input type="text" name="tiempo_uso"class="form-control">	
                        </div> 

                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <img src="img/foto.webp" id="foto" height="250" width="250">


                    </div>
                    <div>
                        <input class="form-control" type="file" name="fileimagen" id="archivos" multiple> 
                    </div>

                    <div class="form-group">
                        <label>Categoria</label>
                        <select name="categoria" class="form-control">
                            <c:forEach var="ca" items="<%=lista%>">
                                <option value="${ca.getIdCategoria()}">${ca.getDescripcion()}</option>
                            </c:forEach>
                        </select>
                    </div>      
                </div>
            </div>
        </div>
                                <br>
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4">
                <center>
                    <input type="submit" class="form-control btn btn-primary" value="Publicar" name="">
                </center>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </form>
    <script src="../js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
