<%-- 
    Document   : Perfil
    Created on : 1/07/2019, 09:05:26 PM
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
                ProductoDAO pdao = new ProductoDAO();
                CategoriaDao cd = new CategoriaDao();
                List<PublicarVO> producto = pdao.listar(vo.getId());
                List<CategoriasVo> lista = cd.listar();
            %>               
            <jsp:include page="../Encabezado.jsp"></jsp:include>
          

            <div class="container">
                <div class="row" style="border: 1px solid #E1E1E1;">
                    <div class="col-md-4">
                        <img src="" width="250" height="250">                    
                    </div>
                    <div class="col-md-8">
                        <br>
                        <div class="col-md-5">
                            <h4>Nombre : ${usuario.getNombres()}</h4>
                        <br>
                        <br>
                        <h4>Telefono : ${usuario.getTelefono()} </h4>
                        <br>
                        <br>
                        <a href="editar.jsp"><input type="submit" name="accion" value="Editar Perfil" class="btn btn-primary form-control"></a>
                    </div>
                    <div class="col-md-7">
                        <h4>Correo : ${usuario.getCorreo()}</h4>
                        <br>
                        <br>     
                        <h4>Ciudad : ${usuario.getCiudadVO().getDescripcion()}</h4>
                        <br>
                        <br>
                        <a href="Editarclave.jsp"><input type="submit" name="accion" value="Cambiar Contraseña" class="btn btn-primary form-control"></a>
                    </div>
                </div>
            </div>
            <br>
            <br>
            ${errorp}
            <c:forEach var="pd" items="<%=producto%>">
                <div class="container">
                    <center>
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
                                <a href="../listarproducto?idproducto=${pd.getId_publicar()}"><input type="submit" class="form-control btn btn-primary" value="Editar " ></a>
                                <br>
                                <br>
                                <a href="../Detallesproducto?idproducto=${pd.getId_publicar()}"><input type="submit" class="form-control btn btn-primary" value="Detalles " ></a>
                                <br>
                                <br>
                                <a href="../eliminar?ideli=${pd.getId_publicar()}"><input type="submit" class="form-control btn btn-primary" value="Eliminar "</a> 
                                <br>
                                <br>
                            </div>                   


                        </div>
                    </center>
                </div>
            </div>
        </c:forEach>
        <script src="../js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
</html>
